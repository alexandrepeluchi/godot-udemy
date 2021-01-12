extends "res://Characters/NPCs/PlayerDetection.gd"

onready var navigation = get_tree().get_root().find_node("Navigation2D", true, false)
onready var destinations = navigation.get_node("Destinations")

var motion := Vector2()
var possible_destinations: Array
var path: Array

export var minimum_arrival_distance: int = 5
export var walk_speed: float = 0.5

func _ready() -> void:
	randomize()
	possible_destinations = destinations.get_children()
	make_path()

func make_path() -> void:
	var new_destination = possible_destinations[randi() % possible_destinations.size() - 1]
	path = navigation.get_simple_path(position, new_destination.position, false)

func _physics_process(delta: float) -> void:
	navigate()

func navigate():
	var distance_to_destination = position.distance_to(path[0])
	if distance_to_destination > minimum_arrival_distance:
		move()
	else:
		update_path()
		
func move() -> void:
	look_at(path[0])
	motion = ((path[0] - position).normalized() * MAX_SPEED * walk_speed)
	
	if is_on_wall():
		make_path()
	
	move_and_slide(motion)
	
func update_path() -> void:
	if path.size() == 1:
		if $Timer.is_stopped():
			$Timer.start()
	else:
		path.remove(0)

func _on_Timer_timeout() -> void:
	make_path()
