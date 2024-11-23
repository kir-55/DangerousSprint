extends Control

@export var initialPlayerSpeed:int =  500

func _on_exit_pressed():
	get_tree().quit()
	

func _on_again_pressed():
	GlobalVariables.last_score = 0
	GlobalVariables.player_global_speed = initialPlayerSpeed
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
