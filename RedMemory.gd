extends Area2D

func _on_RedMemory_body_entered(body):
	
	if body.has_method("pickUpRedMemory"):
		body.pickUpRedMemory()
		$anim.play("consoom")
		yield(get_tree().create_timer(1),"timeout")
		
		queue_free() # Replace with function body. # Replace with function body.
