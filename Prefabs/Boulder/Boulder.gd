extends KinematicBody2D

var speed = 80
var velocity = Vector2.ZERO
var direction= Vector2.RIGHT
var gravity = 500


func _process(delta):
	velocity.x = speed * direction.x
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_hitBox_body_entered(body):
	if body.name == "Player":
		if body.has_method("hurt"):
			body.hurt(0.5)
		


