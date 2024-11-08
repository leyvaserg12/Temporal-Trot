extends Node2D

#func _ready() -> void:
#	$Fade_transition/AnimationPlayer.play("RESET")

func _on_start_pressed() -> void:
	# the fade transition doesn't work, so it just looks like a big stutter 
	# before the game starts
	
	#$Fade_transition.show()
	#$Fade_transition/fade_timer.start()
	#$Fade_transition/AnimationPlayer.play("fade_in")
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")

func _on_instructions_pressed() -> void:
	$main_menu/Instructions.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()

#func _on_fade_timer_timeout() -> void:
#	if button_type == "start":
#		get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
		
