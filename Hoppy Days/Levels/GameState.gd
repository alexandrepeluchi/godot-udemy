extends Node2D

export var lives = 3
export var coins = 0
export var target_number_of_coins = 10

func _ready():
	add_to_group("Gamestate")
	update_GUI()

func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	
	if lives < 0:
		end_game()

func update_GUI():
	get_tree().call_group("GUI", "update_GUI", lives, coins)	

func coin_up():
	coins += 1
	update_GUI()	
	get_tree().call_group("GUI", "update_coins", coins)
	var multiple_of_coins = (coins % target_number_of_coins) == 0
	
	if multiple_of_coins:
		life_up()
		coins = 0		

func life_up():
	lives += 1
	update_GUI()

func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")
	
func win_game():
	get_tree().change_scene("res://Levels/Victory.tscn")
