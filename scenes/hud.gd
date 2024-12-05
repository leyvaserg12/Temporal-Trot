class_name scoreDisplay extends CanvasLayer

# variables to indicate a new game and new current score
var endGame = false
@onready var currentScore = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# increase the score by 1 while the current run is not finished
	if !endGame:
		currentScore += 1
		$score.text = "SCORE: " + str(currentScore)
		
# stops the game when player dies (to indicate the stop of the score, and resetting)
func _on_game_scene_player_died() -> void:
	endGame = true
