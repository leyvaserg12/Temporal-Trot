class_name Player

extends CharacterBody2D

@onready var game: Game = get_tree().root.get_child(0)
@onready var camera: PCamera = game.get_node("Camera")
@onready var viewport: Viewport = get_viewport()

@onready var window_size: Vector2 = viewport.get_visible_rect().size

@onready var anim: AnimatedSprite2D = $Sprite
@onready var jump_fx: AudioStreamPlayer = $"jump-fx"
@onready var death_fx: AudioStreamPlayer = $"death-fx"
@onready var tp_fx: AudioStreamPlayer = $"tp-fx"

@onready var teleporting = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(_delta: float) -> void:
	# flowchart for animation, air > moving > idle
	if not teleporting:
		if not is_on_floor():
			anim.speed_scale = 1
			anim.play("playerJump")
		elif abs(velocity.x) > 20:
			anim.speed_scale = clampf(velocity.x / SPEED, 0.5, 2)
			anim.play("playerRun")
		else:
			anim.play("playerIdle")
			
	# teleport animation in _handle_teleport()
	else:
		if not anim.is_playing():
			teleporting = false
		

#sound effects
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("mv_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_fx.play()
		
	# Handle Teleport Animation
	if Input.is_action_just_pressed("mv_tele"):
		_handle_teleport()
		tp_fx.play()
	
	# Move the dude.
	var direction := Input.get_axis("mv_left", "mv_right")
	if direction:
		velocity.x = direction * SPEED + camera.speed
	else:
		velocity.x = move_toward(velocity.x, camera.speed, SPEED)
	
	# Kills you dead if you fall off camera.
	if (position.y > camera.get_screen_center_position().y + window_size.y/2/camera.zoom.y or
		position.x < camera.get_screen_center_position().x - window_size.x/2/camera.zoom.x):
		game.player_collided.emit()
	
	move_and_slide()

func _handle_teleport():
	teleporting = true
	anim.stop()
	anim.speed_scale = 1.25
	anim.play("playerTeleport")
