extends CharacterBody2D

const SPEED = 350.0
const JUMP_VELOCITY = -459.0

var control_locked = false
var lock_time = 0.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func jump():
	velocity.y = JUMP_VELOCITY
	

func jump_side(x):
	control_locked = true
	lock_time = 0.25
	velocity.y = JUMP_VELOCITY
	velocity.x = x



func _physics_process(delta):
	if control_locked:
		lock_time -= delta
	if lock_time <= 0:
		control_locked = false
	#animations
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else :
		sprite_2d.animation = "default"
	
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if direction and not control_locked:
		velocity.x = direction * SPEED
	elif not control_locked:
		velocity.x = move_toward(velocity.x, 0, 20)

	move_and_slide()

	# Check if moving left and flip the sprite.
	var isleft = velocity.x < 0
	sprite_2d.flip_h = isleft
