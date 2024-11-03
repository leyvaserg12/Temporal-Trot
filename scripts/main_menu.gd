extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	# load game scene when start button pressed
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")


func _on_instructions_pressed() -> void:
	# load instructions scene
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
