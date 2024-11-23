extends Node

@export var max_health := 80.0

@onready var health = max_health

var player: Node2D

func take_damage(value):
	health -= value
	if health <= 0:
		print("damage")
		get_parent().queue_free()
