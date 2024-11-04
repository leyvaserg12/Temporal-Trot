extends Node2D

var button_type = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fade_transition/AnimationPlayer.play("RESET")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	button_type = "start"
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")



func _on_instructions_pressed() -> void:
	button_type = "instructions"
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	# checks button type and plays scene after fade transition
	
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
		
	elif button_type == "instructions":
		get_tree().change_scene_to_file("res://scenes/instructions.tscn")
