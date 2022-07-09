extends Area2D

func _ready():
	if PlayerVariables.blue_memory_found==true:
		queue_free()

func _on_BlueMemory_body_entered(body):
	if body.has_method("pickUpBlueMemory"):
		body.pickUpBlueMemory()
		$anim.play("consoom")
		yield(get_tree().create_timer(1),"timeout")
		
		queue_free() # Replace with function body.
