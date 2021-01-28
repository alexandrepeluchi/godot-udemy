extends "res://Doors/Door.gd"

func _on_Door_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/Numpad.popup_centered()

func _on_Door_body_exited(body: KinematicBody2D):
	if body.collision_layer == 1:
		can_click = false
		$CanvasLayer/Numpad.hide()
