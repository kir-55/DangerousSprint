extends Timer

func _on_timeout():
	GlobalVariables.change_level(GlobalVariables.LEVELS.MIDAGE)
