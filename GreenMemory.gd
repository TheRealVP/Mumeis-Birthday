extends Area2D

func _ready():
	pass

func _on_GreenMemory_body_entered(body):
		if body.has_method("pickUpGreenMemory"):
			body.pickUpGreenMemory()
			$anim.play("consoom")
			yield(get_tree().create_timer(1),"timeout")
		
			queue_free() # Replace with function body.
