extends Control

func _ready():
	# var person = "Daiane"
	var prompts = ["Daiane", "banana", "feliz", "glorioso"]
	#var story = "Era uma vez, %s assistiu %s e pensou esse foi o %s filme das ultimas duas décadas."
	var story = "Era uma vez, alguém chamado %s comeu um sanduiche com gosto de %s que fez se sentir %s, por dentro. Este foi um dia %s."
	print(story % prompts)
	
	prompts = ["Snow", "atum", "agitado", "engraçado"]
	print(story % prompts)
	
	
	