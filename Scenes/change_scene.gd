extends Timer

@export var player: Node2D

func _on_timeout():
	GlobalVariables.last_score += player.global_position.x / GlobalVariables.score_divider
	GlobalVariables.change_level(GlobalVariables.LEVELS.MIDAGE)
