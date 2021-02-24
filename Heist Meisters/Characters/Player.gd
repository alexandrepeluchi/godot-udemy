extends "res://Characters/TemplateCharacter.gd"

var motion := Vector2()

const PLAYER_SPRITE = "res://GFX/PNG/Hitman 1/hitman1_stand.png"
const PLAYER_LIGHT = "res://GFX/PNG/Hitman 1/hitman1_stand.png"
const PLAYER_OCCLUDER = "res://Characters/HumanOccluder.tres"

const BOX_SPRITE = "res://GFX/PNG/Tiles/tile_130.png"
const BOX_LIGHT = "res://GFX/PNG/Tiles/tile_130.png"
const BOX_OCCLUDER = "res://Characters/BoxOccluder.tres"

var velocity_multiplier: float = 1.0

var disguised: bool = false
export var disguise_slowdown: float = 0.25
export var disguise_duration: float = 5.0

func _ready():
	$Timer.wait_time = disguise_duration
	reveal()

func _physics_process(delta: float) -> void:
	update_movement()
	move_and_slide(motion * velocity_multiplier)
	
func update_movement() -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED)
	elif Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0)
	else:
		motion.y = lerp(motion.y, 0, FRICTION)
		
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED)		
	elif Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED, 0)	
	else:
		motion.x = lerp(motion.x, 0, FRICTION)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_vision_mode"):
		get_tree().call_group("Interface", "cycle_vision_mode")
	if Input.is_action_just_pressed("toggle_disguise"):
		toggle_disguise()

func toggle_disguise():
	if disguised:
		reveal()
	else:
		disguise()

func reveal():
	$Sprite.texture = load(PLAYER_SPRITE)
	$Light2D.texture = load(PLAYER_LIGHT)	
	$LightOccluder2D.occluder = load(PLAYER_OCCLUDER)
	
	velocity_multiplier = 1.0
	
	disguised = false
	collision_layer = 1
	
func disguise():
	$Sprite.texture = load(BOX_SPRITE)
	$Light2D.texture = load(BOX_LIGHT)
	$LightOccluder2D.occluder = load(BOX_OCCLUDER)
	
	velocity_multiplier = disguise_slowdown
	
	disguised = true
	collision_layer = 16
	$Timer.start()
	
