extends Node2D
@onready var present: Node2D = $Present
@onready var future: Node2D = $Future

@onready var current_dimension = present

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
		
