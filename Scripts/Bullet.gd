extends Area2D

var move = Vector2.ZERO
var look_vec= Vector2.ZERO
var player = null
var speed = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	
	move = Vector2.ZERO
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	position +=move
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Bullet_body_entered(body):
	if body.has_method("hurt"):
		body.hurt(1) # Replace with function body.
		queue_free()
