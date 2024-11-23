extends Area2D



func _on_body_entered(body):
	if body.name == "Player":
		var last_score = body.last_score
		var best_score = GlobalVariables.best_score
		if best_score and last_score > best_score:
			GlobalVariables.last_score = last_score
			GlobalVariables.best_score = last_score
		else:
			GlobalVariables.last_score = last_score
		get_tree().change_scene_to_file("res://Scenes/menus/game_over_menu.tscn")
