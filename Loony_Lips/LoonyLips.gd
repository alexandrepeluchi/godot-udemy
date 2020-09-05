extends Control

func _ready():
	var prompts = ["Daiane", "acai", "explendida", "fantastico"]
	var story = "Era uma vez, alguém chamado %s comeu um sanduiche com gosto de %s que fez se sentir %s, por dentro. Este foi um dia %s."
	$VBoxContainer/DisplayText.text = story % prompts
	
func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)
	
func _on_TextureButton_pressed():
	var words = $VBoxContainer/HBoxContainer/PlayerText.text
	update_DisplayText(words)

func update_DisplayText(new_text):
	$VBoxContainer/DisplayText.text = new_text
	$VBoxContainer/HBoxContainer/PlayerText.clear()


