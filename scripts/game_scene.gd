class_name Game

extends Node2D

@onready var player: Player = $Player
@onready var timer: Timer = $DeathTimer
@onready var present: Node2D = $Present
@onready var future: Node2D = $Future
@onready var pparallax: CanvasLayer = $PresentParallax
@onready var fparallax: CanvasLayer = $FutureParallax

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
	
	timer.timeout.connect(reload)
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
		fparallax.visible = true
		toggle_dimension(present, false)
		pparallax.visible = false
	else:
		current_dimension = PRESENT
		toggle_dimension(present, true)
		pparallax.visible = true
		toggle_dimension(future, false)
		fparallax.visible = false

func player_dies():
	# get_tree().quit()
	print("Player Died")
	player_died.emit()
	player.queue_free()
	# timer starts -> timeout
	timer.start()
	
func reload():
	get_tree().change_scene_to_file("res://scenes/end_scene.tscn")	
	
