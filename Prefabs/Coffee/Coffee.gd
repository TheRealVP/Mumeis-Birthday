extends Area2D


var coffee_power_up = preload("res://Prefabs/Coffee/CoffeePowerUp.tscn")


func _on_Coin_body_entered(body):
	if body.has_method("coinPickUp"):
		var coffee_power = coffee_power_up.instance()
		body.add_child(coffee_power)
		$anim.play("Picked")
		yield(get_tree().create_timer(0.7),"timeout")
		
		queue_free()
