extends KinematicBody2D

var target = null
var state = STATE.IDLE

var speed = 80
var velocity = Vector2.ZERO
var direction= Vector2.RIGHT
var gravity = 500

enum STATE {
	IDLE,
	CHASE
}

onready var player_detection = $PlayerDetection


func _process(delta):
	match state:
		STATE.IDLE:
			pass
		STATE.CHASE:
			direction = global_position.direction_to(target.global_position).normalized()
			velocity.x = speed * direction.x
			velocity.y += gravity * delta
			velocity= move_and_slide(velocity, Vector2.UP)
			$Sprite.flip_h = false if direction.x < 0 else true



func _on_PlayerDetection_body_entered(body):
	if body.is_in_group("Cheese"):
		target = body
		state = STATE.CHASE

func _on_PlayerDetection_body_exited(body):
	target = null
	state = STATE.IDLE
