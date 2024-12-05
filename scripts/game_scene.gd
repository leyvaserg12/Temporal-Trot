class_name Game

extends Node2D

@onready var player: Player = $Player
@onready var timer: Timer = $DeathTimer
@onready var pparallax: CanvasLayer = $PresentParallax
@onready var fparallax: CanvasLayer = $FutureParallax
@onready var terrain: Node = $Terrain
@onready var camera: Camera2D = $Camera
@onready var template: Node = $Template
@onready var piece_queue: Array[Setpiece] = [$Terrain/Starter]

const camera_width: int = 640

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
		
func toggle_indv_dimension(dim: Node2D, vis: bool):
	dim.visible = vis
	var layer = 1 if vis else 0
		
	dim.get_node("Terrain").tile_set.set_physics_layer_collision_layer(0, layer)

func toggle_dimension(dim: DIM, vis: bool):
	var sel1 = "Present" if dim == DIM.PRESENT else "Future"
	var sel2 = "Future" if dim == DIM.PRESENT else "Present"
	for piece: Setpiece in terrain.get_children():
		toggle_indv_dimension(piece.get_node(sel1), vis)
		toggle_indv_dimension(piece.get_node(sel2), not vis)

func teleport():
	if current_dimension == DIM.PRESENT:
		current_dimension = DIM.FUTURE
		
		toggle_dimension(DIM.FUTURE, true)
		fparallax.visible = true
		pparallax.visible = false
	else:
		current_dimension = DIM.PRESENT
		toggle_dimension(DIM.PRESENT, true)
		pparallax.visible = true
		fparallax.visible = false
	
	#teleport flash animation
	get_node("Camera").get_node("Teleport Flash")._flash()

func player_dies():
	# get_tree().quit()
	print("Player Died")
	player_died.emit()
	player.queue_free()
	timer.start()
	
	
func reload():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _physics_process(_delta: float) -> void:
	assert(piece_queue.size() > 0, "Out of setpieces!")
	
	if piece_queue.front().End.global_position.x < camera.get_screen_center_position().x - camera_width/2:
		piece_queue.pop_front().queue_free()
		
	if piece_queue.back().End.global_position.x < camera.get_screen_center_position().x + camera_width:
		var piece: Setpiece = template.get_children().pick_random().duplicate()
		terrain.add_child(piece)
		piece.position = piece_queue.back().End.global_position
		toggle_indv_dimension(piece.Present, current_dimension == DIM.PRESENT)
		toggle_indv_dimension(piece.Future, current_dimension == DIM.FUTURE)
		piece_queue.append(piece)
		
	
	
