extends CanvasLayer

# variables for current run score & to indicate if the game is still running to track the score
var currentScore = 0
var runScore = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# show score on screen
	if runScore: 
		currentScore += 1
		$currentScore.text = "SCORE: " + str(currentScore)

# stop keeping score when player dies
func _on_game_scene_player_died() -> void:
	runScore = false
	
