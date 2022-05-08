extends Area2D



func _on_Hazards_body_entered(body):
	print("Object has entered")
	if body.has_method("hurt"):
		body.hurt()
