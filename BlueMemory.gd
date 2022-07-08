extends Area2D


func _on_BlueMemory_body_entered(body):
	if body.has_method("pickUpBlueMemory"):
		body.pickUpBlueMemory()
		$anim.play("consoom")
		yield(get_tree().create_timer(1),"timeout")
		
		queue_free() # Replace with function body.
