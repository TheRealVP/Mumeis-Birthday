extends Area2D



func _on_Coin_body_entered(body):
	if body.has_method("coinPickUp"):
		body.coinPickUp()
		$anim.play("Picked")
		yield(get_tree().create_timer(0.7),"timeout")
		
		queue_free()
