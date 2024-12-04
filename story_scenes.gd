extends Node2D

var sceneNumber = 1
var currentScene = "res://assets/textures/ui/story_scenes/scene1.png"
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		# when mouse is pressed go to next scene
		if Input.is_action_just_pressed("mv_jump"):
			#check if we're on last scene and go to game play
			sceneNumber += 1
			if sceneNumber == 5:
				get_tree().change_scene_to_file("res://scenes/game_scene.tscn")	
			currentScene = _switch_scenes(sceneNumber)
		$scene.texture = load(currentScene)
		

# function to switch to next scene / switch texture of scene
func _switch_scenes(scene_number) -> String:
	var newScene = "res://assets/textures/ui/story_scenes/scene"+ str(scene_number) + ".png"
	print(newScene)
	return newScene
