extends CanvasLayer


var currentScore = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_restart_pressed() -> void:
	# restart the game when button is pressed
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")	
	pass # Replace with function body.


func _on_score_display_end_score(score) -> void:
	currentScore = score
	pass # Replace with function body.
	
