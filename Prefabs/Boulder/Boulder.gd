extends KinematicBody2D


onready var animation = $anim

export var speed = 120
var velocity = Vector2.ZERO
var direction= Vector2.RIGHT
var gravity = 500

var state = STATE.IDLE

enum STATE {
	IDLE,
	HIT
}


func _process(delta):
	match state:
		STATE.IDLE:
			chase(delta)
		STATE.HIT:
			animation.play("Hurt") #animation calls knockback_done()


func knockback_done():
	state = STATE.IDLE
	animation.play("Run")


func chase(delta):
	velocity.x = speed * direction.x
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_hitBox_body_entered(body):
	if body.name == "Player":
		if body.has_method("hurt"):
			body.hurt(0.5)
		state = STATE.HIT
		


