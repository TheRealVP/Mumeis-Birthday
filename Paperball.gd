extends KinematicBody2D


signal mooms_bumped
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0)
export var facing=1
const SPITFORCE= -400
# Called when the node enters the scene tree for the first time.
func _ready():
	print("I spawned")
	velocity.y=SPITFORCE # Replace with function body.
	velocity.x=facing*100

func _physics_process(delta):
	velocity.y+=10
	velocity=move_and_slide(velocity,Vector2.UP)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if(collision.collider.name == "mumei"):
			collision.collider.ouch()
			queue_free()
		if(collision.collider.name == "Fallzone"):
			queue_free() 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
