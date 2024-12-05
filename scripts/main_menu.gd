extends Node2D

@onready var transition = $Transition

var story_scene = preload("res://scenes/story_scene.tscn")
func _on_start_pressed() -> void:
	transition.play("fade_out")

func _on_instructions_pressed() -> void:
	$Menu/Instructions.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_transition_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(story_scene)
