class_name Game

extends Node2D

@onready var player: Player = $Player
@onready var timer: Timer = $DeathTimer
@onready var pparallax: CanvasLayer = $PresentParallax
@onready var fparallax: CanvasLayer = $FutureParallax
@onready var terrain: Node = $Terrain

enum DIM {PRESENT, FUTURE}
enum STATE {RUNNING, GAMEOVER}

var current_dimension = DIM.PRESENT
var state: STATE = STATE.RUNNING

# seperate signals, just in case the player somehow survives
signal player_collided
signal player_died

func _ready() -> void:
	# make sure the present and future are in the right state
	toggle_dimension(DIM.PRESENT, true)
	toggle_dimension(DIM.FUTURE, false)
	
	timer.timeout.connect(reload)
	player_collided.connect(player_dies)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mv_tele"):
		teleport()

func toggle_dimension(dim: DIM, vis: bool):
	var str = "Present" if dim == DIM.PRESENT else "Future"
	for piece in terrain.get_children():
		piece.get_node(str).visible = vis
		var layer = 1 if vis else 0
		
		piece.get_node(str).get_node("Terrain").tile_set.set_physics_layer_collision_layer(0, layer)

func teleport():
	if current_dimension == DIM.PRESENT:
		current_dimension = DIM.FUTURE
		
		toggle_dimension(DIM.FUTURE, true)
		fparallax.visible = true
		toggle_dimension(DIM.PRESENT, false)
		pparallax.visible = false
	else:
		current_dimension = DIM.PRESENT
		toggle_dimension(DIM.PRESENT, true)
		pparallax.visible = true
		toggle_dimension(DIM.FUTURE, false)
		fparallax.visible = false

func player_dies():
	# get_tree().quit()
	print("Player Died")
	player_died.emit()
	player.queue_free()
	timer.start()
	
	
func reload():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
