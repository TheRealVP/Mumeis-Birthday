extends Area2D

var crunchfx = load( "res://Sounds/berrycrunchy.mp3" )

export var value = 1

func _ready():
	print("I spawned")
	print(self.position)

func _on_Basket_body_entered(body):
	if body.has_method("basketPickUp"):
		body.basketPickUp(value)
		$anim.play("Picked")
		$SFX.stream= crunchfx
		$SFX.play()
		yield(get_tree().create_timer(0.7),"timeout")
		
		queue_free() # Replace with function body.
