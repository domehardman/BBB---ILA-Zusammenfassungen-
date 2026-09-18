extends Resource
class_name TireModel

@export var peak_grip_coefficient = 0.9
@export var grip_multiplier = 1.1
#friction circle shape
@export var friction_circle_exponent = 1.0

@export var pacejka_b_lateral = 12.0
@export var pacejka_c_lateral = 1.3
@export var pacejka_e_lateral = 0.9
@export var peak_slip_angle_deg = 8.0

@export var pacejka_b_longitudinal = 14.0
@export var pacejka_c_longitudinal = 1.5
@export var pacejka_e_longitudinal = 0.85
@export var peak_slip_ratio = 0.12

@export var ideal_temperature = 60.0
@export var temperature_window = 90.0
@export var min_temperature_grip = 0.3
@export var heating_rate = 0.015
@export var cooling_rate = 0.15

@export var wear_rate = 0.00009
@export var min_wear_grip = 0.8

@export var reference_load = 2200.0
@export var load_sensitivity = 0.15

func _pacejka(normalized_slip, b, c, e):
	var bx = b * normalized_slip
	var inner_part = bx - e * (bx - atan(bx))
	return sin(c * atan(inner_part))

func compute_load_factor(wheel_load):
	var load_ratio = wheel_load / reference_load
	return 1.0 - load_sensitivity * (load_ratio - 1.0)

func compute_temperature_grip(temperature):
	var deviation = abs(temperature - ideal_temperature)
	return clamp(1.0 - (deviation / temperature_window), min_temperature_grip, 1.0)

func compute_wear_grip(wear):
	return lerp(1.0, min_wear_grip, wear)

func update_temperature(temperature, slip_amount, load_factor, ambient_temperature, delta):
	var new_temperature = temperature + slip_amount * heating_rate * (1.0 + load_factor)
	new_temperature = lerp(new_temperature, ambient_temperature, cooling_rate * delta)
	return clamp(new_temperature, ambient_temperature, ideal_temperature + 200.0)

func update_wear(wear, temperature, slip_amount, delta):
	var new_wear = wear
	if temperature > ideal_temperature:
		new_wear += (temperature - ideal_temperature) * wear_rate * delta
	new_wear += slip_amount * wear_rate * 0.5 * delta
	return clamp(new_wear, 0.0, 1.0)

#real friction circle
func compute_target_force(slip_angle_rad, slip_ratio, wheel_load, temperature, wear) -> Vector2:
	var slip_angle_deg = rad_to_deg(slip_angle_rad)

	var lateral_normalized = slip_angle_deg / peak_slip_angle_deg
	var longitudinal_normalized = slip_ratio / peak_slip_ratio

	#p norm shape
	var p = max(friction_circle_exponent * 2.0, 0.1)
	var total_slip_magnitude = pow(pow(abs(lateral_normalized), p) + pow(abs(longitudinal_normalized), p), 1.0 / p)
	total_slip_magnitude = max(total_slip_magnitude, 0.0001)

	#clamp curve input
	var slip_for_curve = min(total_slip_magnitude, 1.5)

	var lateral_raw = _pacejka(slip_for_curve, pacejka_b_lateral, pacejka_c_lateral, pacejka_e_lateral)
	var longitudinal_raw = _pacejka(slip_for_curve, pacejka_b_longitudinal, pacejka_c_longitudinal, pacejka_e_longitudinal)

	var lateral_share = lateral_normalized / total_slip_magnitude
	var longitudinal_share = longitudinal_normalized / total_slip_magnitude

	var load_factor = compute_load_factor(wheel_load)
	var temp_factor = compute_temperature_grip(temperature)
	var wear_factor = compute_wear_grip(wear)

	var max_force = wheel_load * peak_grip_coefficient * grip_multiplier * load_factor * temp_factor * wear_factor

	var lateral_force = lateral_raw * lateral_share * max_force
	var longitudinal_force = longitudinal_raw * longitudinal_share * max_force

	return Vector2(lateral_force, longitudinal_force)
