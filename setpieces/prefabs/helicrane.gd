class_name Helicrane

extends Area2D

@onready var root = get_tree().root.get_child(0) as Game
@onready var player = root.get_node("Player")

func _on_body_entered(body: Node) -> void:
	if body == player and is_visible_in_tree():
		root.player_collided.emit()
