extends KinematicBody2D
export(PackedScene) var POOP: PackedScene = preload("res://guano.tscn")

var velocity = Vector2(0,0)
export var direction = -1
var speed = 70
var dying = false
var pooping = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default") # Replace with function body.
	if(direction ==1):
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.y=0
	if is_on_wall():
		direction=direction*-1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	velocity.x=speed*direction
	if(dying==false):
		velocity.y=0
	velocity = move_and_slide(velocity, Vector2.UP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_top_checker_body_entered(body):
	if(body.get_name() == "mumei"):
		body.add_bump()
		#set_physics_process(false)
		$AnimatedSprite.flip_v = not $AnimatedSprite.flip_v
		speed = 0
		set_collision_layer_bit(3, false)
		set_collision_mask_bit(0,false)
		$top_checker.set_collision_mask_bit(0,false)
		$top_checker.set_collision_mask_bit(3,false)
		#$sides_checker.set_collision_mask_bit(0,false)
		#$sides_checker.set_collision_mask_bit(3,false)
		dying = true

func _on_Timer_timeout():
	if(dying ==true):
		queue_free()
	elif(pooping==true):
		var poop = POOP.instance()
		get_tree().current_scene.add_child(poop)
		poop.global_position = self.global_position
	#get_tree() # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	print("CLENCH")
	pooping= false # Replace with function body.


func _on_VisibilityNotifier2D_screen_entered():
	print("BRAAAAP")
	pooping= true # Replace with function body.
