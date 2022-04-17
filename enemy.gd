extends KinematicBody2D

signal enemy_squished
signal mooms_bumped

var velocity = Vector2(0,0)
var speed = 70
var dying = false
export var direction =-1

# Called when the node enters the scene tree for the first time.
func _ready():
	if direction==1:
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction

func _physics_process(delta):
	if speed > 0:
		$AnimatedSprite.play("crawl")
	else:
		$AnimatedSprite.play("squish")
	if is_on_wall() or not $floor_checker.is_colliding() and is_on_floor():
		direction=direction*-1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	velocity.x=speed*direction
	velocity.y+=20
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_top_checker_body_entered(body):
	if(body.get_name() == "mumei"):
		body.add_bump()
		#set_physics_process(false)
	emit_signal("enemy_squished")
	$AnimatedSprite.play("squish")
	speed = 0
	set_collision_layer_bit(3, false)
	set_collision_mask_bit(0,false)
	$top_checker.set_collision_mask_bit(0,false)
	$top_checker.set_collision_mask_bit(3,false)
	$sides_checker.set_collision_mask_bit(0,false)
	$sides_checker.set_collision_mask_bit(3,false)
	dying=true


func _on_sides_checker_body_entered(body):
	if(body.get_name() == "mumei") and dying==false:
		emit_signal("mooms_bumped")
