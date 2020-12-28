extends Control

func _on_Dai_pressed():
	Global.character = 1
	get_tree().change_scene("res://Levels/Level1.tscn")

func _on_Duh_pressed():
	Global.character = 2
	get_tree().change_scene("res://Levels/Level1.tscn")

func _on_Bru_pressed():
	Global.character = 3
	get_tree().change_scene("res://Levels/Level1.tscn")

func _on_Isa_pressed():
	Global.character = 4
	get_tree().change_scene("res://Levels/Level1.tscn")
