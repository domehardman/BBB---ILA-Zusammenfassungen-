extends Damper
class_name DamperFriction

@export var friction_force = 1500
@export var release_speed = 0.02

var _locked = true
var _last_force = 0.0

#friction disc
func compute_force(compression_speed):
	if abs(compression_speed) < release_speed:
		_locked = true
	else:
		_locked = false

	if _locked:
		_last_force = lerp(_last_force, 0.0, 0.3)
	else:
		_last_force = sign(compression_speed) * friction_force
	return _last_force
