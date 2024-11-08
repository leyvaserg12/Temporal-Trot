extends Node2D

func _process(_delta: float) -> void:
	if visible:
		$Instruction/jump.play("playerJump")
		$Instruction/run.play("playerRun")
		$Instruction/teleport.play("playerTeleport")
	
func _on_texture_button_pressed() -> void:
	self.visible = not visible
