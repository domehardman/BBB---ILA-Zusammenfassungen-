extends AxleGeometry
class_name AxleDeDion

@export var spring_rate = 20000.0
@export var ideal_height = 1.0
@export var track_width = 1.4
@export var anti_roll_rate = 8000.0

func compute_forces(left_compression, right_compression, left_compression_speed, right_compression_speed, delta) -> AxleErgebnis:
	var result = AxleErgebnis.new()

	var left_damper_force = left_damper.compute_force(left_compression_speed) if left_damper else 0.0
	var right_damper_force = right_damper.compute_force(right_compression_speed) if right_damper else 0.0

	var roll_diff = left_compression - right_compression
	var anti_roll_force = roll_diff * anti_roll_rate

	result.left_force = clamp_spring_force(spring_rate * left_compression + left_damper_force + anti_roll_force)
	result.right_force = clamp_spring_force(spring_rate * right_compression + right_damper_force - anti_roll_force)

	var axle_roll_deg = rad_to_deg(atan2(right_compression - left_compression, track_width))
	result.left_camber_deg = camber_deg_rest + axle_roll_deg
	result.right_camber_deg = camber_deg_rest + axle_roll_deg
	result.reaction_torque = 0.0
	return result
