extends CharacterBody2D

# Constants
@export var SPEED: float = 600.0              # Horizontal movement speed
@export var MAX_SPEED : float = 1000.0
@export var JUMP_VELOCITY: float = -500.0     # Jump velocity
@export var MAX_JUMP_VEL : float = -700.0
@export var DROP_THROUGH_VELOCITY: float = 700  # Downward drop velocity (controlled fall)
@export var score_label : Label

# Variables
@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")  # Sync gravity with project settings
var direction: Vector2 = Vector2.ZERO  # Movement direction
var start_x
var score

func _ready():
	start_x = global_position.x
	if GlobalVariables.player_global_speed:
		SPEED = GlobalVariables.player_global_speed

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
			if SPEED < MAX_SPEED:
				SPEED += 20
				GlobalVariables.player_global_speed = SPEED
			if JUMP_VELOCITY > MAX_JUMP_VEL:
				JUMP_VELOCITY -= 5
		
	# Handle dropping down
	if Input.is_action_just_pressed("bottom"):
		drop_through()

	# Set horizontal movement speed
	velocity.x = direction.x * SPEED
	
	score = abs(floori(global_position.x) - floori(start_x)) / 12
	score_label.set_text(str(score))

	# Move the character
	move_and_slide()

func drop_through() -> void:
	# Temporarily disable collision to allow dropping through platforms
	print("works")
	position.y += DROP_THROUGH_VELOCITY * get_physics_process_delta_time()
	velocity.y = DROP_THROUGH_VELOCITY
