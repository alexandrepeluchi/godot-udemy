extends "res://Characters/TemplateCharacter.gd"

const FOV_TOLERANCE: float = 20.0
const MAX_DETECTION_RANGE: int = 640
const RED := Color(1, 0.25, 0.25)
const WHITE := Color(1, 1, 1)

var Player

func _ready() -> void:
	Player = get_node("/root").find_node("Player", true, false)
	
func _process(delta: float):
	if Player_in_FOV() and Player_in_LOS():
		$Torch.color = RED
	else:
		$Torch.color = WHITE
		
func Player_in_FOV() -> bool:
	var npc_facing_direction := Vector2(1, 0).rotated(global_rotation)
	var direction_to_Player := Vector2( (Player.position - global_position).normalized() )

	if abs(direction_to_Player.angle_to(npc_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false

func Player_in_LOS() -> bool:
	var space := get_world_2d().direct_space_state
	var LOS_obstacle = space.intersect_ray(global_position, Player.global_position, [self], collision_mask)
	
	if not LOS_obstacle:
		return false
	
	var distance_to_player = Player.global_position.distance_to(global_position)
	var Player_in_Range = distance_to_player < MAX_DETECTION_RANGE	
	
	if LOS_obstacle.collider == Player and Player_in_Range:
		return true
	else:
		return false