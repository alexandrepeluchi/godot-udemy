extends Area2D

var can_click: bool = false

func _on_Door_body_entered(body: KinematicBody2D):
	if body.collision_layer == 1:
		can_click = true
	else:
		open()

func _on_Door_body_exited(body: KinematicBody2D):
	if body.collision_layer == 1:
		can_click = false

func _on_Door_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		open()

func open():
	$AnimationPlayer.play("Open")
