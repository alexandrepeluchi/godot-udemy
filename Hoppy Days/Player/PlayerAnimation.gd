extends AnimatedSprite

func _on_Player_animate(motion):
	if motion.y < 0 and Input.is_action_pressed("jump"):
		play("jump")
	elif motion.y < 0 and not Input.is_action_pressed("jump"):
		play("hurt")
	elif motion.x > 0:
		play("walk")
		flip_h = false
	elif motion.x < 0:
		play("walk")
		flip_h = true	
	else:
		play("idle")
