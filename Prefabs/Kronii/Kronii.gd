extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 2
var dying = false
var swooped=false
var direction_x=1
var direction_y=1
var flip=1
var counter=1
var lives=15

signal kronii_is_hit

var gwak= load("res://Sounds/gwak-kronii-By-Tuna.mp3" )

signal kronii_is_dead

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



func _on_hitBox_area_entered(area):
	if area.is_in_group("Sword"):
		lives -=1
		emit_signal("kronii_is_hit")
		playHit()
		
		if lives <=0:
			emit_signal("kronii_is_dead")
			
			queue_free() # Replace with function body.

func playHit():
	$SFX.stream= gwak
	$SFX.play()
	$GwakTimer.start()
	$Animation.set_modulate(Color(1,0,0))
	var timer := Timer.new()
	add_child(timer)
	timer.wait_time = 0.3
	timer.one_shot = true
	timer.start()
	timer.connect("timeout", self, "_on_timer_timeout")

func _on_timer_timeout() -> void:
	$Animation.set_modulate(Color(1,1,1))
	

func _on_GwakTimer_timeout():
	$SFX.stop() # Replace with function body.
