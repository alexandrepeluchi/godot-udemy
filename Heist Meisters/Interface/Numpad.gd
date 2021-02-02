extends Popup

var combination: Array = []
var guess: Array

onready var display = $VBoxContainer/DisplayContainer/Display
onready var light = $VBoxContainer/ButtonContainer/GridContainer/StatusLight

signal combination_correct

func _ready() -> void:
	connect_buttons()
	reset_lock()
	
func connect_buttons() -> void:
	for child in $VBoxContainer/ButtonContainer/GridContainer.get_children():
		if child is Button:
			child.connect("pressed", self, "Button_pressed", [child.text])
			
func Button_pressed(button) -> void:
	if button == "OK":
		check_guess()
	else:
		enter(int(button))
	
func check_guess() -> void:
	if guess == combination:
		$AudioStreamPlayer.stream = load("res://SFX/threeTone1.ogg")
		$AudioStreamPlayer.play()
		light.texture = load("res://GFX/Interface/PNG/dotGreen.png")
		$Timer.start()
	else:
		reset_lock()
	
func enter(button) -> void:
	$AudioStreamPlayer.stream = load("res://SFX/twoTone1.ogg")
	$AudioStreamPlayer.play()
	guess.append(button)
	update_display()
	
func update_display() -> void:
	display.text = PoolStringArray(guess).join("")
	if guess.size() == combination.size():
		check_guess()

func reset_lock() -> void:
	light.texture = load("res://GFX/Interface/PNG/dotRed.png")
	display.text = ""
	guess.clear()

func _on_Timer_timeout() -> void:
	emit_signal("combination_correct")
	reset_lock()
