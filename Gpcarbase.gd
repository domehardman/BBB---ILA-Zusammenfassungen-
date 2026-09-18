extends RigidBody3D
class_name GPCarBase

#vehicle data
@export var vehicle_mass_kg = 1200.0
@export var engine_power_hp = 180.0
@export var max_rpm = 5500.0
@export var idle_rpm = 800.0
@export var peak_torque_fraction = 0.7

#gearbox
@export var gear_ratios = [3.5, 2.2, 1.5, 1.1]
@export var final_drive_ratio = 3.8

#tires and axles
@export var tire_front: TireModel
@export var tire_rear: TireModel
@export var axle_front: AxleGeometry
@export var axle_rear: AxleGeometry

#aero at 200 kmh
@export var downforce_kg_200_front = 45.0
@export var downforce_kg_200_rear = 75.0
@export var aero_drag_kg_200 = 60.0

#physics constants
@export var ideal_height = 1.0
@export var steering_angle = 0.4
@export var rolling_resistance = 0.015
@export var wheel_radius = 0.7
@export var brake_force = 4000.0
@export var brake_bias = 0.65

#handbrake
@export var handbrake_force = 6000.0
@export var handbrake_grip_loss = 0.4

#geometry and environment
@export var wheelbase = 2.5
@export var track_width = 1.4
@export var ambient_temperature = 20.0
@export var camber_grip_threshold_deg = 3.0
@export var camber_grip_penalty = 0.03

#tire relaxation length
@export var relaxation_length = 0.2

#wheel mass
@export var wheel_mass_kg = 18.0

@onready var all_rays = [$Raycasts/Ray_VL, $Raycasts/Ray_VR, $Raycasts/Ray_HL, $Raycasts/Ray_HR]
@onready var all_meshes = [$RadMeshes/Rad_VL, $RadMeshes/Rad_VR, $RadMeshes/Rad_HL, $RadMeshes/Rad_HR]
@onready var display_label = $Label

var wheel_rest_basis = [Basis(), Basis(), Basis(), Basis()]
var wheel_visual_rotation = [0.0, 0.0, 0.0, 0.0]
var tire_temperature = [20.0, 20.0, 20.0, 20.0]
var tire_wear = [0.0, 0.0, 0.0, 0.0]
var wheel_rpm = [0.0, 0.0, 0.0, 0.0]

var _current_tire_force = [Vector2.ZERO, Vector2.ZERO, Vector2.ZERO, Vector2.ZERO]
var current_gear = 1
var engine_rpm = 0.0

const HP_TO_WATT = 735.5
const GRAVITY = 9.81

func _ready():
	mass = vehicle_mass_kg
	tire_temperature = [ambient_temperature, ambient_temperature, ambient_temperature, ambient_temperature]
	for i in range(4):
		wheel_rest_basis[i] = all_meshes[i].transform.basis
	if axle_front: axle_front.instance_dampers()
	if axle_rear: axle_rear.instance_dampers()

#wheel inertia
func _wheel_inertia() -> float:
	return 0.5 * wheel_mass_kg * wheel_radius * wheel_radius

func tire_for_wheel(i) -> TireModel:
	return tire_front if (i == 0 or i == 1) else tire_rear

func measure_wheel_compression(ray, contact_offset):
	if not ray.is_colliding(): return null
	var point = ray.get_collision_point()
	var dist = ray.global_position.distance_to(point)
	var compression = ideal_height - dist
	var point_velocity = linear_velocity + angular_velocity.cross(contact_offset)
	var compression_speed = -point_velocity.dot(ray.global_basis.y)
	return {"compression": compression, "speed": compression_speed, "point": point}

func compute_camber_grip_factor(camber_deg):
	var deviation = max(0.0, abs(camber_deg) - camber_grip_threshold_deg)
	return clamp(1.0 - deviation * camber_grip_penalty, 0.3, 1.0)

func _physics_process(delta):
	var brake_pedal = Input.get_action_strength("ui_down")
	var gas_pedal = Input.get_action_strength("ui_up")
	var steer_input = Input.get_axis("ui_right", "ui_left")
	var handbrake = Input.get_action_strength("ui_select")
	var speed = linear_velocity.length()

	#wake on input
	if gas_pedal > 0.0 or brake_pedal > 0.0 or abs(steer_input) > 0.0:
		sleeping = false

	#standstill stabilizer
	if speed < 0.2 and gas_pedal == 0.0:
		var hold_force = -linear_velocity * mass * 15.0
		var hold_torque = -angular_velocity * mass * 15.0
		apply_central_force(hold_force)
		apply_torque(hold_torque)

	#aero forces
	var speed_factor = (speed * 3.6) / 200.0
	var speed_squared = speed_factor * speed_factor

	#soft motion blend
	var motion_factor = smoothstep(0.05, 0.3, speed)
	if motion_factor > 0.0:
		var drag_force = aero_drag_kg_200 * GRAVITY * speed_squared
		var roll_drag = mass * GRAVITY * rolling_resistance
		apply_central_force(-linear_velocity.normalized() * (drag_force + roll_drag) * motion_factor)

	var downforce_front = (downforce_kg_200_front * GRAVITY * speed_squared) * 0.5
	var downforce_rear = (downforce_kg_200_rear * GRAVITY * speed_squared) * 0.5

	if Input.is_action_just_pressed("ui_page_up") and current_gear < gear_ratios.size(): current_gear += 1
	if Input.is_action_just_pressed("ui_page_down") and current_gear > 1: current_gear -= 1

	var gear_factor = gear_ratios[current_gear - 1] * final_drive_ratio
	engine_rpm = clamp((speed / (TAU * wheel_radius)) * gear_factor * 60.0, idle_rpm, max_rpm)

	var rpm_fraction = engine_rpm / max_rpm
	var torque_factor = lerp(0.4, 1.0, rpm_fraction / peak_torque_fraction) if rpm_fraction < peak_torque_fraction else lerp(1.0, 0.6, (rpm_fraction - peak_torque_fraction) / (1.0 - peak_torque_fraction))

	#engine torque
	var engine_torque = (engine_power_hp * HP_TO_WATT) / (max(engine_rpm, 1000.0) * TAU / 60.0)
	#wheel torque
	var wheel_drive_torque = engine_torque * torque_factor * gas_pedal * gear_factor * 0.5

	if display_label:
		display_label.text = "Gear: %d\nSpeed: %.0f km/h\nRPM: %.0f" % [current_gear, speed * 3.6, engine_rpm]

	var ackermann_left = 0.0
	var ackermann_right = 0.0
	if steer_input != 0.0:
		var turn_radius = max(wheelbase / tan(abs(steer_input * steering_angle)), track_width/2.0 + 0.1)
		var angle_inner = atan(wheelbase / (turn_radius - track_width / 2.0))
		var angle_outer = atan(wheelbase / (turn_radius + track_width / 2.0))
		ackermann_left = angle_inner if steer_input > 0 else -angle_outer
		ackermann_right = angle_outer if steer_input > 0 else -angle_inner

	var wheel_data = []
	for i in range(4): wheel_data.append(measure_wheel_compression(all_rays[i], all_rays[i].global_position - global_position))

	var result_front = axle_front.compute_forces(wheel_data[0]["compression"], wheel_data[1]["compression"], wheel_data[0]["speed"], wheel_data[1]["speed"], delta) if axle_front and wheel_data[0] and wheel_data[1] else null
	var result_rear = axle_rear.compute_forces(wheel_data[2]["compression"], wheel_data[3]["compression"], wheel_data[2]["speed"], wheel_data[3]["speed"], delta) if axle_rear and wheel_data[2] and wheel_data[3] else null

	for i in range(4):
		var ray = all_rays[i]
		var mesh = all_meshes[i]
		var is_rear = (i >= 2)
		var is_left = (i == 0 or i == 2)
		var tire = tire_for_wheel(i)

		if wheel_data[i]:
			var contact_offset = ray.global_position - global_position
			var axle_result = result_front if not is_rear else result_rear

			var spring_force = 0.0
			var camber = 0.0
			if axle_result != null:
				spring_force = axle_result.left_force if is_left else axle_result.right_force
				camber = axle_result.left_camber_deg if is_left else axle_result.right_camber_deg

			apply_force(ray.global_basis.y * spring_force, contact_offset)
			var wheel_load = max(0.0, spring_force)

			var current_downforce = downforce_rear if is_rear else downforce_front
			apply_force(-global_basis.y * current_downforce, contact_offset)

			var steer_angle = ackermann_left if i == 0 else (ackermann_right if i == 1 else 0.0)
			var dir_side = global_basis.x
			var dir_forward = -global_basis.z
			if not is_rear:
				dir_side = dir_side.rotated(global_basis.y, steer_angle)
				dir_forward = dir_forward.rotated(global_basis.y, steer_angle)

			var point_velocity = linear_velocity + angular_velocity.cross(contact_offset)
			var side_speed = point_velocity.dot(dir_side)
			var forward_speed = point_velocity.dot(dir_forward)

			#smooth slip blend
			var slip_angle = 0.0
			const SLIP_ANGLE_THRESHOLD = 0.5
			if abs(forward_speed) > SLIP_ANGLE_THRESHOLD:
				slip_angle = atan2(side_speed, abs(forward_speed)) * sign(forward_speed)
			else:
				var blend = abs(forward_speed) / SLIP_ANGLE_THRESHOLD
				slip_angle = atan2(side_speed, max(abs(forward_speed), SLIP_ANGLE_THRESHOLD)) * blend

			var drive_torque = wheel_drive_torque if is_rear else 0.0
			var foot_brake_torque = brake_force * (brake_bias if not is_rear else (1.0 - brake_bias)) * brake_pedal * wheel_radius
			var hand_brake_torque = (handbrake_force * 0.5 * handbrake * wheel_radius) if is_rear else 0.0
			var max_brake_torque = foot_brake_torque + hand_brake_torque
			var wheel_inertia = _wheel_inertia()

			var omega = wheel_rpm[i]
			var tire_reaction_torque = _current_tire_force[i].y * wheel_radius
			omega += ((drive_torque - tire_reaction_torque) / wheel_inertia) * delta

			if max_brake_torque > 0.0:
				var max_delta = (max_brake_torque / wheel_inertia) * delta
				omega = 0.0 if abs(omega) <= max_delta else omega - sign(omega) * max_delta

			var bearing_friction = 2.0 * delta
			if drive_torque == 0.0 and max_brake_torque == 0.0:
				if abs(omega) <= bearing_friction:
					omega = 0.0
				else:
					omega -= sign(omega) * bearing_friction

			wheel_rpm[i] = omega
			var wheel_speed = omega * wheel_radius
			var slip_ratio = clamp((wheel_speed - forward_speed) / max(abs(forward_speed), 0.1), -3.0, 3.0)

			var handbrake_factor = lerp(1.0, handbrake_grip_loss, handbrake) if (is_rear and handbrake > 0.0) else 1.0

			var target_force = tire.compute_target_force(slip_angle, slip_ratio, wheel_load, tire_temperature[i], tire_wear[i])
			target_force.x *= -compute_camber_grip_factor(camber) * handbrake_factor
			target_force.y *= compute_camber_grip_factor(camber) * handbrake_factor

			#update temp and wear
			var lateral_heat_share = rad_to_deg(slip_angle) / tire.peak_slip_angle_deg
			var longitudinal_heat_share = slip_ratio / tire.peak_slip_ratio
			var slip_amount = sqrt(lateral_heat_share * lateral_heat_share + longitudinal_heat_share * longitudinal_heat_share)
			var load_factor = wheel_load / max(tire.reference_load, 1.0)
			tire_temperature[i] = tire.update_temperature(tire_temperature[i], slip_amount, load_factor, ambient_temperature, delta)
			tire_wear[i] = tire.update_wear(tire_wear[i], tire_temperature[i], slip_amount, delta)

			#exponential smoothing
			var wheel_travel_in_delta = max(abs(forward_speed), 0.5) * delta
			var lerp_weight = 1.0 - exp(-wheel_travel_in_delta / relaxation_length)
			_current_tire_force[i] = _current_tire_force[i].lerp(target_force, lerp_weight)

			if speed < 0.1 and gas_pedal == 0.0:
				_current_tire_force[i] = Vector2.ZERO

			apply_force(dir_side * _current_tire_force[i].x + dir_forward * _current_tire_force[i].y, contact_offset)

			mesh.global_position = wheel_data[i]["point"] + ray.global_basis.y * wheel_radius
			wheel_visual_rotation[i] = wrapf(wheel_visual_rotation[i] + omega * delta, 0.0, TAU)
			var local_basis = Basis(Vector3.UP, steer_angle) * wheel_rest_basis[i]
			mesh.transform.basis = local_basis.rotated(local_basis.y.normalized(), wheel_visual_rotation[i])

		else:
			mesh.global_position = ray.global_position - ray.global_basis.y * (ideal_height + 0.3 - wheel_radius)
			wheel_rpm[i] = lerp(wheel_rpm[i], 0.0, 2.0 * delta)
			_current_tire_force[i] = Vector2.ZERO
			var steer_angle = ackermann_left if i == 0 else (ackermann_right if i == 1 else 0.0)
			wheel_visual_rotation[i] = wrapf(wheel_visual_rotation[i] + wheel_rpm[i] * delta, 0.0, TAU)
			var local_basis = Basis(Vector3.UP, steer_angle) * wheel_rest_basis[i]
			mesh.transform.basis = local_basis.rotated(local_basis.y.normalized(), wheel_visual_rotation[i])
