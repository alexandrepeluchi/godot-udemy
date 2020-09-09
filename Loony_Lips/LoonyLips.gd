extends Control

var player_words = []
var prompts = ["um nome", "um substantivo", "um adverbio", "um adjetivo"]
var story = "Era uma vez, alguem chamado %s comeu um sanduiche recheado de %s que fez se sentir %s, por dentro. Este foi um dia %s."

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
onready var ButtonLabel = $VBoxContainer/HBoxContainer/Label

func _ready():
	DisplayText.text = "Bem vindo ao Loony Lips! Nos vamos contar uma historia e ter um otimo momento juntos!"
	check_player_words_lenght()
	PlayerText.grab_focus()
	
func _on_PlayerText_text_entered(new_text):
	add_to_player_words()
	
func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_lenght()

func is_story_done():
	return player_words.size() == prompts.size()
	
func check_player_words_lenght():
	if is_story_done():
		end_game()
	else:
		prompt_player()
		
func tell_story():
	DisplayText.text = story % player_words

func prompt_player():
	DisplayText.text += "\n\nDigite " + prompts[player_words.size()] + ", por favor?"
	
func end_game():
	PlayerText.queue_free()
	ButtonLabel.text = "Repetir!"
	tell_story()
	
	
	
	
	
