extends KinematicBody2D

signal struck
var velocity = Vector2(0,0)
var berries = 0
var caffeinated = false
var hearts = 3
var bumps = 0
var mudspeed =0
var hit = false
const SPEED = 180
const GRAVITY = 30
const JUMPFORCE= -900
func _physics_process(delta):
	if Input.is_action_pressed("right") and is_on_floor():
		velocity.x=SPEED - mudspeed
		if(caffeinated==true):
			velocity.x*=2
		$Sprite.play("walk")
		$Sprite.flip_h = true
	elif Input.is_action_pressed("left") and is_on_floor():
		velocity.x=-SPEED + mudspeed
		if(caffeinated==true):
			velocity.x*=2
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif not is_on_floor():
		$Sprite.play("air")
		if Input.is_action_pressed("left") :
			velocity.x=-SPEED
			if(caffeinated==true):
				velocity.x*=2.5
			$Sprite.flip_h = false
		elif  Input.is_action_pressed("right"):
			velocity.x=SPEED
			if(caffeinated==true):
				velocity.x*=2.5
			$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	velocity.y= velocity.y+30
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y=JUMPFORCE+ mudspeed*8
		if(caffeinated==true):
			velocity.y*=1.5
		$Sprite.play("air")
	#if(caffeinated==false):
	velocity=move_and_slide(velocity,Vector2.UP)
	#else:
#		velocity=move_and_slide(velocity*2,Vector2.UP)
	
	if is_on_floor():
		if bumps> 0: 
			bumps -=1
		
	
	velocity.x= lerp(velocity.x, 0, 0.1)
	
	if berries ==100:
		get_tree().change_scene("res://Level1.tscn")


func _on_Fallzone_body_entered(body):
	if(body.name=="mumei"):
		get_tree().change_scene("res://Level1.tscn") # Replace with function body.

func add_berry():
	berries = berries +1

func set_caffeinated():
	caffeinated=true
	$CaffeineTimer.start()

func in_the_mud():
	if(caffeinated==false):
		mudspeed=80

func out_of_the_mud():
	mudspeed=0

func add_bump():
	if(bumps<4):
		bumps+=2
	print(bumps)
	velocity.y= (JUMPFORCE/3)* bumps

func ouch():
	if(hit==false && caffeinated==false):
		emit_signal("struck")
		hit=true
		hearts -= 1
		set_modulate(Color(1,0.3,0.3,0.5))
		$BumpTimer.start()
		velocity.y= JUMPFORCE * 0.3
		if hearts==0:
			get_tree().change_scene("res://TitleMenu.tscn")
		
		
func _on_guano_mooms_bumped():
	if(hit==false && caffeinated==false):
		emit_signal("struck")
		hearts -= 1
		set_modulate(Color(1,0.3,0.3,0.5))
		$BumpTimer.start()
		velocity.y= JUMPFORCE * 0.3
		if hearts==0:
			get_tree().change_scene("res://TitleMenu.tscn")

func _on_BumpTimer_timeout():
	hit=false
	set_modulate(Color(1,1,1,1))


func _on_enemy_mooms_bumped():
	if(hit==false && caffeinated==false):
		emit_signal("struck")
		hearts -= 1
		set_modulate(Color(1,0.3,0.3,0.5))
		$BumpTimer.start()
		velocity.y= JUMPFORCE * 0.3
		if hearts==0:
			get_tree().change_scene("res://TitleMenu.tscn")


func _on_CaffeineTimer_timeout():
	caffeinated=false
	 # Replace with function body.
