extends Damper
class_name DamperHydraulic

@export var bump_damping = 1800
@export var rebound_damping = 2600

#bump and rebound
func compute_force(compression_speed):
	if compression_speed > 0.0:
		return compression_speed * bump_damping
	else:
		return compression_speed * rebound_damping
