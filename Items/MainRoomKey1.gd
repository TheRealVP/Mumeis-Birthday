extends Area2D


func _on_MainRoomKey1_body_entered(body):
	print("GET KEY")
	if body.has_method("keyPickUpMainDoor1"):
		body.keyPickUpMainDoor1()
		$anim.play("picked")
		yield(get_tree().create_timer(1),"timeout")
		
		queue_free() # Replace with function body.
