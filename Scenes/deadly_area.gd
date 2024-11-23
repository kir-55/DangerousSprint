extends Area2D



func _on_body_entered(body):
	if body.name == "Player":
		body.visible = false
		Engine.time_scale = 0.1
	
