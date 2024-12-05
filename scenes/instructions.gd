extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# shows animations for instructions
	$Instruction/jump.play("playerJump")
	$Instruction/run.play("playerRun")
	$Instruction/teleport.play("playerTeleport")
	

func _on_texture_button_pressed() -> void:
	self.visible = not visible
	


func _on_exit_pressed() -> void:
	self.visible = not visible
