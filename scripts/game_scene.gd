extends Node2D
@onready var present: Node2D = $Present
@onready var future: Node2D = $Future

@onready var current_dimension = present

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	$Fade_transition/AnimationPlayer.play("fade_out")

	
	#Connecting collision signal from all existing obstacles
	#will need to change as procedural generated obstacles are implemented
	for obstacle in present.get_node("Obstacle_Manager").get_children():
		obstacle.connect("player_collided", _player_dies) 	
		
	for obstacle in future.get_node("Obstacle_Manager").get_children():
		obstacle.connect("player_collided", _player_dies) 	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#teleport check
	if Input.is_action_just_pressed("teleport"):
		print("Teleport")
		teleport()

func teleport():
	
	#present to future
	if current_dimension == present:
		current_dimension = future
		present.is_here = false
		future.is_here = true
		
		
	#future to present
	else:
		current_dimension = present
		present.is_here = true
		future.is_here = false
		

func _player_dies():
	print("Player Died")
