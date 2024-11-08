extends CharacterBody2D
@onready var anim = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

#animation for movement
func _process(_delta):
	var is_moving = false
	
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		is_moving = true
	
	if Input.is_action_pressed("ui_accept"):
		anim.play("playerJump")
		is_moving = true
		
	if not is_moving and not Input.is_action_pressed("ui_accept"):
		anim.play("playerIdle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if abs(velocity.x) > 0.1:
		anim.play("playerRun")
		
	move_and_slide()
