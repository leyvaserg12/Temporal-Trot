class_name PCamera 

extends Camera2D

@export var maxSpeed := 256
@export var acceleration := 64

signal speed_update

var speed = 0

func _physics_process(delta: float) -> void:
	if speed < maxSpeed:
		speed += delta * acceleration
		speed_update.emit(speed)
		
	self.position.x += speed * delta
