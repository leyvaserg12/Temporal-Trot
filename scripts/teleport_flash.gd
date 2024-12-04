extends Node2D


@onready var anim: AnimationPlayer = $AnimationPlayer


func _flash():
	anim.play("teleportFlash")
