extends Control

var player_words = []
var prompts = ["um nome", "um substantivo", "um adverbio", "um adjetivo"]
var story = "Era uma vez, alguém chamado %s comeu um sanduiche recheado de %s que fez se sentir %s, por dentro. Este foi um dia %s."

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	check_player_words_lenght()
	
func _on_PlayerText_text_entered():
	add_to_player_words()
	
func _on_TextureButton_pressed():
	add_to_player_words()

func add_to_player_words():
	player_words.append(PlayerText.text)
	PlayerText.clear()
	check_player_words_lenght()

func is_story_done():
	return player_words.size() == prompts.size()
	
func check_player_words_lenght():
	if is_story_done():
		tell_story()
	else:
		prompt_player()
		
func tell_story():
	DisplayText.text = story % player_words

func prompt_player():
	DisplayText.text = "Posso ter " + prompts[player_words.size()] + ", por favor?"
	
	
	
	
	
	
	
