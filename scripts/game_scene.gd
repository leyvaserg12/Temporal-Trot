class_name Game

extends Node2D

@onready var present: Node2D = $Present
@onready var future: Node2D = $Future

enum {PRESENT, FUTURE}
enum STATE {RUNNING, GAMEOVER}

var current_dimension = PRESENT
var state: STATE = STATE.RUNNING

# seperate signals, just in case the player somehow survives
signal player_collided
signal player_died

func _ready() -> void:
	# make sure the present and future are in the right state
	toggle_dimension(present, true)
	toggle_dimension(future, false)
	
	player_collided.connect(player_dies)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mv_tele"):
		teleport()

func toggle_dimension(dim: Node2D, vis: bool):
	dim.visible = vis
	var layer = 1 if vis else 0
	
	dim.get_node("Terrain").tile_set.set_physics_layer_collision_layer(0, layer)

func teleport():
	if current_dimension == PRESENT:
		current_dimension = FUTURE
		toggle_dimension(future, true)
		toggle_dimension(present, false)
	else:
		current_dimension = PRESENT
		toggle_dimension(present, true)
		toggle_dimension(future, false)

func player_dies():
	# get_tree().quit()
	print("Player Died")
