class_name PCamera 

extends Camera2D

@onready var game: Game = $".."

@export var maxSpeed := 256
@export var acceleration := 64

var speed = 0

func _ready() -> void:
	game.player_died.connect(player_died)
	pass

func _physics_process(delta: float) -> void:
	if speed < maxSpeed:
		speed += delta * acceleration
		
	self.position.x += speed * delta
	
func player_died():
	speed = 0
	acceleration = 0
