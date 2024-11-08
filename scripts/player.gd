class_name Player

extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@export var camera: Camera2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var camera_speed = 0

func _process(_delta: float) -> void:
	# flowchart for animation, air > moving > idle
	if not is_on_floor():
		anim.speed_scale = 1
		anim.play("playerJump")
	elif abs(velocity.x) > 20:
		anim.speed_scale = clampf(velocity.x / SPEED, 0.5, 2)
		anim.play("playerRun")
	else:
		anim.play("playerIdle")
		

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("mv_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("mv_left", "mv_right")
	if direction:
		velocity.x = direction * SPEED + camera_speed
	else:
		velocity.x = move_toward(velocity.x, camera_speed, SPEED)
		
	move_and_slide()

# this isn't a great way to update the player's speed, but it works for the moment
func _on_camera_speed_update(cspeed) -> void:
	camera_speed = cspeed
