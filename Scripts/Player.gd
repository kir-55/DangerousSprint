extends CharacterBody2D

# Constants
@export var SPEED: float = 600.0              # Horizontal movement speed
@export var JUMP_VELOCITY: float = -500.0     # Jump velocity
@export var DROP_THROUGH_VELOCITY: float = 700  # Downward drop velocity (controlled fall)

# Variables
@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")  # Sync gravity with project settings
var direction: Vector2 = Vector2.ZERO  # Movement direction

func _physics_process(delta: float) -> void:
	# Apply gravity if not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle movement input
	direction.x = 1# Input.get_action_strength("right") - Input.get_action_strength("ui_left")

	if is_on_floor():
		# Handle jumping
		if Input.is_action_just_pressed("up"):
			velocity.y = JUMP_VELOCITY
		
	# Handle dropping down
	if Input.is_action_just_pressed("bottom"):
		drop_through()

	# Set horizontal movement speed
	velocity.x = direction.x * SPEED

	# Move the character
	move_and_slide()

func drop_through() -> void:
	# Temporarily disable collision to allow dropping through platforms
	print("works")
	position.y += DROP_THROUGH_VELOCITY * get_physics_process_delta_time()
	velocity.y = DROP_THROUGH_VELOCITY
