extends CanvasLayer

# variables for current run score & to indicate if the game is still running to track the score
signal endScore(score)

# variables to indicate a new game and new current score
var endGame = false
var currentScore = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# show score on screen
	# increase the score by 1 while the current run is not finished
	if !endGame:
		currentScore += 1
		$currentScore.text = "SCORE: " + str(currentScore)
	pass

# stop keeping score when player dies
func _on_game_scene_player_died() -> void:
	endGame = true
	
