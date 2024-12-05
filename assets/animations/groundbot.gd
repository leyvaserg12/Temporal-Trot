class_name groundBot

extends Area2D

@onready var root = get_tree().root.get_child(0) as Game
@onready var player = root.get_node("Player")

func _on_body_entered(body: Node) -> void:
	if body == player and is_visible_in_tree():
		root.player_collided.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimatedSprite2D.play("ground1")
