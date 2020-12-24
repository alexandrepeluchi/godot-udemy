extends CanvasLayer

func update_GUI(lives_left, coins):
	$Pontuacao/TextureRect/HBoxContainer/LifeCount.text = str(lives_left)
	$Pontuacao/TextureRect/HBoxContainer/CoinCount.text = str(coins)
