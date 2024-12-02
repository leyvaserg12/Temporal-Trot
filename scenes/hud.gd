extends CanvasLayer

signal endScore(score)

# variables to indicate a new game and new current score
var endGame = false
var currentScore = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# increase the score by 1 while the current run is not finished
	if !endGame:
		currentScore += 1
		$score.text = "SCORE: " + str(currentScore)
	pass
	print(currentScore)

func _on_game_scene_player_died() -> void:
	# if player dies stop the count
	emit_signal("endScore", currentScore)
	endGame = true
	pass # Replace with function body.
