extends Control

var player_words = []
var current_story = {}

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
onready var ButtonLabel = $VBoxContainer/HBoxContainer/Label

func _ready():
	set_current_story()
	DisplayText.text = "Bem vindo ao Loony Lips! Nos vamos contar uma historia e ter um otimo momento juntos!"
	check_player_words_lenght()
	PlayerText.grab_focus()
	
func set_current_story():
	randomize()
	var stories = $StoryBook.get_child_count()
	var selected_story = randi() % stories
	current_story.prompts = $StoryBook.get_child(selected_story).prompts
	current_story.story = $StoryBook.get_child(selected_story).story

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
	return player_words.size() == current_story.prompts.size()
	
func check_player_words_lenght():
	if is_story_done():
		end_game()
	else:
		prompt_player()
		
func tell_story():
	DisplayText.text = current_story.story % player_words

func prompt_player():
	DisplayText.text += "\n\nDigite " + current_story.prompts[player_words.size()] + ", por favor?"
	
func end_game():
	PlayerText.queue_free()
	ButtonLabel.text = "Repetir!"
	tell_story()
	
	
	
	
	
