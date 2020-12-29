extends Control

func _on_RestartButton_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")

func _on_Exit_pressed():
	get_tree().change_scene("res://Levels/Menu.tscn")
