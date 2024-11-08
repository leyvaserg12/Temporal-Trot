extends Node2D
@onready var present: Node2D = $Present
@onready var future: Node2D = $Future

enum {PRESENT, FUTURE}

@onready var current_dimension = PRESENT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	#$Fade_transition/AnimationPlayer.play("fade_out")
	
	#will need to change as procedural generated obstacles are implemented
	for obstacle in present.get_node("Obstacle_Manager").get_children():
		obstacle.connect("player_collided", _player_dies) 	
		
	for obstacle in future.get_node("Obstacle_Manager").get_children():
		obstacle.connect("player_collided", _player_dies) 	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mv_tele"):
		teleport()

func toggle_dimension(dim: Node2D, vis: bool):
	dim.visible = vis
	var layer = 1 if vis else 0
	var mask = 2 if vis else 0
	
	dim.get_node("Terrain").tile_set.set_physics_layer_collision_layer(0, layer)
	for obstacle in dim.get_node("Obstacle_Manager").get_children():
		obstacle.collision_mask = mask

func teleport():
	
	if current_dimension == PRESENT:
		current_dimension = FUTURE
		toggle_dimension(future, true)
		toggle_dimension(present, false)
	else:
		current_dimension = PRESENT
		toggle_dimension(present, true)
		toggle_dimension(future, false)

func _player_dies():
	# get_tree().quit()
	print("Player Died")
