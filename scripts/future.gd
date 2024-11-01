extends Node2D
@onready var obstacle_manager: Node2D = $Obstacle_Manager
@onready var terrain: TileMap = $Terrain

var is_here = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	
	if self.is_here:
		#future is visible
		visible = true
		
		#future terrain and obstacles in collision layer 1
		terrain.tile_set.set_physics_layer_collision_layer(0, 1)
		for obstacle in obstacle_manager.get_children():
			obstacle.collision_layer = 1

	else:
		#future is invisible
		visible = false
		
		#future terrain and obstacles in collision layer 0
		terrain.tile_set.set_physics_layer_collision_layer(0, 0)
		for obstacle in obstacle_manager.get_children():
			obstacle.collision_layer = 0
		
	
