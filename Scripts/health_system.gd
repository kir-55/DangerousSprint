extends Node

@export var max_health := 80.0

@onready var health = max_health

var player: Node2D

func take_damage(value):
	if health - value > 0:
		health -= value
	else:
		health = 0
		get_parent().queue_free()
