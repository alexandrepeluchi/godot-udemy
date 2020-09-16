extends KinematicBody2D

var motion = Vector2(0, 0)

const SPEED = 1000
const GRAVITY = 100
const UP = Vector2(0 ,-1)
const JUMP_SPEED = 2000

func _physics_process(delta):
	apply_gravity()
	move()
	jump()
	animate()
	move_and_slide(motion, UP)
	
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED

func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY
		
func animate():
	if motion.y < 0:
		$AnimatedSprite.play("jump")
	elif motion.x > 0:
			$AnimatedSprite.play("walk")
			$AnimatedSprite.flip_h = false
	elif motion.x < 0:
			$AnimatedSprite.play("walk")
			$AnimatedSprite.flip_h = true	
	else:
		$AnimatedSprite.play("idle")



