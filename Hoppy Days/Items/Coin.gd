extends Node2D

func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("die")
	$AudioStreamPlayer2D.play()

func die():
	queue_free()
