extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$background/AnimatedSprite2D.play("playerTeleport")


func _on_end_instructions_pressed() -> void:
	$Label.visibile = not visible
	$Instructions.visible = true


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")


func _on_story_pressed() -> void:
	get_tree().change_scene_to_packed(preload("res://scenes/story_scene.tscn"))
