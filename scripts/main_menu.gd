extends Node2D

#func _ready() -> void:
#	$FadeTransition/AnimationPlayer.play("RESET")

func _on_start_pressed() -> void:
	# the fade transition doesn't work, so it just looks like a big stutter 
	# before the game starts
	
	#$FadeTransition.show()
	#$FadeTransition/fade_timer.start()
	#$FadeTransition/AnimationPlayer.play("fade_in")
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")

func _on_instructions_pressed() -> void:
	$Menu/Instructions.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()

#func _on_fade_timer_timeout() -> void:
#	if button_type == "start":
#		get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
		
