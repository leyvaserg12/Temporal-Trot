extends Area2D

signal player_collided

@onready var player = get_tree().root.get_child(0).get_node("Player")

func _on_body_entered(body: Node) -> void:
	if body == player:
		player_collided.emit()
