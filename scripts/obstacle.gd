extends Area2D

signal player_collided

func _on_body_entered(_body: Node2D) -> void:
	print("collision")
	player_collided.emit()
