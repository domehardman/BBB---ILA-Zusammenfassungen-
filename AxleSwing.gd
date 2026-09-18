extends AxleGeometry
class_name AxleSwing

@export var spring_rate = 19000
@export var ideal_height = 1.0
@export var swing_arm_length = 0.9

#jacking grip penalty
@export var jacking_grip_penalty = 0.02

func compute_forces(left_compression, right_compression, left_compression_speed, right_compression_speed, delta) -> AxleErgebnis:
	var result = AxleErgebnis.new()

	var left_damper_force = left_damper.compute_force(left_compression_speed) if left_damper else 0.0
	var right_damper_force = right_damper.compute_force(right_compression_speed) if right_damper else 0.0

	result.left_force = clamp_spring_force(spring_rate * left_compression + left_damper_force)
	result.right_force = clamp_spring_force(spring_rate * right_compression + right_damper_force)

	#swing arm camber
	var left_ratio = clamp(left_compression / swing_arm_length, -0.95, 0.95)
	var right_ratio = clamp(right_compression / swing_arm_length, -0.95, 0.95)
	result.left_camber_deg = camber_deg_rest + rad_to_deg(asin(left_ratio))
	result.right_camber_deg = camber_deg_rest + rad_to_deg(asin(right_ratio))

	#no reaction torque
	result.reaction_torque = 0.0
	return result

#jacking grip penalty
func compute_jacking_penalty(camber_deg):
	if camber_deg <= 0.0:
		return 1.0
	return clamp(1.0 - camber_deg * jacking_grip_penalty, 0.4, 1.0)
