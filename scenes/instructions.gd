extends Node2D

func _process(_delta: float) -> void:
	if visible:
		$Background/Instruction/Jump.play("playerJump")
		$Background/Instruction/Run.play("playerRun")
		$Background/Instruction/Teleport.play("playerTeleport")
	
func _on_texture_button_pressed() -> void:
	self.visible = not visible
