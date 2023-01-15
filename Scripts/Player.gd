extends KinematicBody

var velocity = Vector3(0,0,0);
var accelleration_magnitude = 1;
var max_speed = 10
var speed_dampening = 0.35;

func _ready():
	pass
	
func _physics_process(delta):
	var accelleration = Vector3(0,0,0)
	if Input.is_action_pressed("ui_right"):
		accelleration.x += 1
	if Input.is_action_pressed("ui_left"):
		accelleration.x -= 1
	if Input.is_action_pressed("ui_up"):
		accelleration.z -= 1
	if Input.is_action_pressed("ui_down"):
		accelleration.z += 1
	velocity += accelleration.normalized() * accelleration_magnitude
	if velocity.length() > max_speed:
		velocity = velocity.normalized() * max_speed
	if velocity.length() < -0.1 or velocity.length() > 0.1 :
		velocity -= velocity.normalized() * speed_dampening
	
	move_and_slide(velocity)
