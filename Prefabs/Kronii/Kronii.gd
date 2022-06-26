extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 2
var dying = false
var hit=false
var swooped=false
var direction_x=1
var direction_y=1
var flip=1
var counter=1
var coinScene = preload("res://Prefabs/Coin/Coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x=0
	velocity.y=0
	#$anim.play("flying")
	#$AnimatedSprite.play("default") # Replace with function body.
	if(velocity.x <0):
		$Animation.flip_h = true
	else:
		$Animation.flip_h = false


func _physics_process(delta):
	
	#state 1
	if(velocity.x>50*flip and velocity.y>50):
		print("flipping y")
		#velocity.y=49
		direction_y*=-1
	elif(velocity.x>50*flip and velocity.y<-50):
		print("flipping x and y")
		#velocity.x=100
		#velocity.y=-100
		direction_x*=-1
		direction_y*=-1
		counter=counter+1
	elif (velocity.x< -50*flip and velocity.y<-50):
		print("flipping y")
		#velocity.y=-49
		direction_y*=-1
		counter=counter+1
	elif (velocity.x< -50*flip and velocity.y>50):
		print("flipping x and y")
		#velocity.x=-49
		#velocity.y=49
		direction_y*=-1
		direction_x*=-1
		counter=counter+1
	
	if(counter==3):
		counter=0
		#flip=flip*-1
	#FLIP
	if(velocity.x<0 ):
		$Animation.flip_h = false
	else:
		$Animation.flip_h = true
		
	velocity.x+=speed*direction_x*flip
	velocity.y+=speed*direction_y
		
	velocity = move_and_slide(velocity, Vector2.UP)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_hitBox_body_entered(body):
	if body.name == "Player":
		swooped=true
		
		hit = true
		body.hurt(0.25)# Replace with function body.


func _on_hitBox_area_entered(area):
	if area.is_in_group("Sword"):
		onDestroyed()
		queue_free()
		
func onDestroyed():
	pass

func _on_BombTimer_timeout():
	print("RELOADING")
	swooped=false # Replace with function body.
