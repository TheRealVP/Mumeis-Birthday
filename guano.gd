extends Area2D

signal mooms_bumped

func _physics_process(delta):
	global_position+= 100 * Vector2.DOWN *delta


# Called when the node enters the scene tree for the first time.

func _on_guano_body_entered(body):
	
	if(body.get_name() == "mumei"):
		body.ouch()
		emit_signal("mooms_bumped")
	if body is TileMap:
		queue_free() # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() # Replace with function body.

