extends KinematicBody2D


var velocity = Vector2(0,0)
const SPEED = 80
const GRAVITY = 50
const JUMP_FORCE = -600

func _physics_process(delta):
	
	velocity.x = SPEED 
	
	if Input.is_action_just_pressed("flap"):
		velocity.y = JUMP_FORCE
	else:
		velocity.y = velocity.y + GRAVITY
	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0,.1)
