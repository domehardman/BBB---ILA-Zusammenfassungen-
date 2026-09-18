extends AxleGeometry
class_name AxleRigid

@export var spring_rate = 18000
@export var ideal_height = 1.0
@export var track_width = 1.4

@export var carries_drive = false
@export var axle_twist_rate = 40000

var _twist_angle = 0.0

func compute_forces(left_compression, right_compression, left_compression_speed, right_compression_speed, delta) -> AxleErgebnis:
	var result = AxleErgebnis.new()

	var left_damper_force = left_damper.compute_force(left_compression_speed) if left_damper else 0.0
	var right_damper_force = right_damper.compute_force(right_compression_speed) if right_damper else 0.0

	result.left_force = clamp_spring_force(spring_rate * left_compression + left_damper_force)
	result.right_force = clamp_spring_force(spring_rate * right_compression + right_damper_force)

	#axle camber
	var axle_roll_deg = rad_to_deg(atan2(right_compression - left_compression, track_width))
	result.left_camber_deg = camber_deg_rest + axle_roll_deg
	result.right_camber_deg = camber_deg_rest + axle_roll_deg

	result.reaction_torque = 0.0
	return result

#axle wind up
func apply_drive_torque(engine_torque, delta):
	if not carries_drive:
		return 0.0
	var target_angle = engine_torque / axle_twist_rate
	_twist_angle = lerp(_twist_angle, target_angle, min(1.0, delta * 20.0))
	return _twist_angle
