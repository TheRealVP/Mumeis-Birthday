extends Area2D

var crunchfx = load( "res://Sounds/berrycrunchy.mp3" )

func _on_Coin_body_entered(body):
	if body.has_method("coinPickUp"):
		body.coinPickUp()
		$anim.play("Picked")
		$SFX.stream= crunchfx
		$SFX.play()
		yield(get_tree().create_timer(0.7),"timeout")
		
		queue_free()
