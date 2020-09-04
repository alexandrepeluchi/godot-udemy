extends Control

func _ready():
	# var person = "Daiane"
	var prompts = ["Daiane", "acai", "explendida", "fantastico"]
	#var story = "Era uma vez, %s assistiu %s e pensou esse foi o %s filme das ultimas duas décadas."
	var story = "Era uma vez, alguém chamado %s comeu um sanduiche com gosto de %s que fez se sentir %s, por dentro. Este foi um dia %s."
	
	$VBoxContainer/DisplayText.text = story % prompts
	
	
	
