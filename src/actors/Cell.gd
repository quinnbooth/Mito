extends Organism

class_name Cell

var topSpd = 100.0
var minSpd = 10.0
var spd = 0.0
var rotSpd = 1.5
var velocity = Vector2.ZERO
var frictionForce = 1.0

onready var target = self.global_position

func _physics_process(delta: float) -> void:
	if (Input.is_mouse_button_pressed(1)): 
		target = get_viewport().get_mouse_position()
		spd = topSpd
	if ((target - self.global_position).length() > 10): move(target, delta)

#Gradually turns/moves node towards target and returns header vector
func move(target, delta) -> Vector2:
	var angleGap = self.transform.x.angle_to(target - self.global_position)
	var angleAdd = sign(angleGap) * min(delta * rotSpd, abs(angleGap))
	self.rotate(angleAdd)
	var angle = self.get_global_transform().get_rotation()
	velocity = Vector2(spd, 0).rotated(angle)
	velocity = move_and_slide(velocity)
	spd = velocity.length() - frictionForce
	if spd < minSpd: spd = topSpd
	return Vector2(cos(angle), sin(angle))
	

