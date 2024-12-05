extends Node2D

@onready var transition = $Transition

func _on_start_pressed() -> void:
	transition.play("fade_out")
	
func _on_instructions_pressed() -> void:
	$Menu/Instructions.visible = true

# changes to story scene after animation
func _on_transition_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/story_scenes.tscn")
