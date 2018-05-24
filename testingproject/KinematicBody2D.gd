extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(int) var randomnumber

var motion = Vector2()
const UP = Vector2(0,-1)
var GRAVITY = 40
const ACCELERATION = 100
const MAX_SPEED = 400
const JUMP_HEIGHT = -1000
const GROUND_FRICTION = 0.2
const AIR_FRICTION = 0.05

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false;
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		friction = true;
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction:
			motion.x = lerp(motion.x, 0, GROUND_FRICTION);
	else:
		if friction:
			motion.x = lerp(motion.x, 0, AIR_FRICTION);
		
	motion = move_and_slide(motion, UP)
	pass
