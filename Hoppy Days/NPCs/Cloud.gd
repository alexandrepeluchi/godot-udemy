extends Node2D

func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()

func fire():
	$Sprite/RayCast2D.add_child(load("res://NPCs/Lightning.tscn").instance())
