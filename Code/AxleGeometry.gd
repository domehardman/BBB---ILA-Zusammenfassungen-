extends Resource
class_name AxleGeometry

#base axle
@export var left_damper: Damper
@export var right_damper: Damper

@export var camber_deg_rest = 0.0

#both wheel forces
func compute_forces(left_compression, right_compression, left_compression_speed, right_compression_speed, delta) -> AxleErgebnis:
	return AxleErgebnis.new()

#no spring pull
func clamp_spring_force(force):
	return max(0.0, force)

#duplicate dampers
func instance_dampers():
	if left_damper:
		left_damper = left_damper.duplicate()
	if right_damper:
		right_damper = right_damper.duplicate()
