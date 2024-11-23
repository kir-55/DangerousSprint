extends Camera2D

@export var speed: float
@export var target: Node
@export var max_distance: Vector2
var distance_to_target: Vector2
@export var offset_x: int = 400


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target and !target.is_queued_for_deletion():
		distance_to_target.x = abs(position.x - target.global_position.x + offset_x) 
		distance_to_target.y = abs(position.y - target.global_position.y)
		
		if distance_to_target.x > max_distance.x:
			position.x = lerp(position.x, target.global_position.x + offset_x, delta*speed)
		
		if distance_to_target.y > max_distance.y:
			position.y = lerp(position.y, target.global_position.y, delta*speed)
