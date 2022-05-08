extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 150
var maxSpeed = 300
var jump = 150
var jumpCount = 0
var wallJump =  -80
var gravity = 300

const FRICTION = 0.70

export (PackedScene) var hurtScreen

var canSlash = false
var isSwooping = false

var lives = PlayerVariables.lives

var coinNumber=PlayerVariables.berries
var downSpeed= 900

# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass # Replace with function body.

func _process(delta):
	
	#BASIC MOVEMENT
	var movement = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if movement != 0 and canSlash==false:
		if $anim.flip_h==true and isSwooping==true:
			velocity.x=200
		elif $anim.flip_h==false and isSwooping==true:
			velocity.x=-200
		else:
			velocity.x += movement * speed * delta
			velocity.x = clamp(velocity.x, -speed, speed)
		$anim.flip_h= movement > 0
		if $anim.flip_h == false:
			$Sword.position.x = -44 
		elif $anim.flip_h == true:
			$Sword.position.x = 2 
		if velocity.x !=0 and velocity.y == 0:
			$anim.play("Walk")
		elif velocity.x ==0 and velocity.y < 0 and canSlash==false:
			print("JUMPING")
			if jumpCount==2:
				$anim.play("DoubleJump")
			else:
				$anim.play("Jump")
		elif velocity.y > 0 and canSlash==false and isSwooping==false:
			$anim.play("Fall")
		elif velocity.y > 0 and canSlash==false and isSwooping==true:
			$anim.play("Swoop")
	
	elif movement == 0 and canSlash==false:
		print("IDLING")
		velocity.x= lerp(velocity.x, 0, FRICTION)
		if velocity.y==0:
			$anim.play("Idle")
		
	#DEATH FALL
	if velocity.y > 350:
		get_tree().reload_current_scene()
		
	#DOUBLE JUMP
	if is_on_floor():
		jumpCount=0
		isSwooping=false
		$Swoopzone/CollisionShape2D.disabled= true
	if !is_on_floor() and Input.is_action_just_pressed("ui_accept")  and jumpCount<2:
		jumpCount+=1
		velocity.y -=clamp(velocity.y, jump, jump)
		#$anim.play("Jump")

	
	if !is_on_floor() and Input.is_action_just_pressed("ui_sword")  and isSwooping==false:
		isSwooping=true
		$Swoopzone/CollisionShape2D.disabled= false
		velocity.y=200
		if $anim.flip_h==true:
			velocity.x=200
		else:
			velocity.x=-200
		
	
	if !is_on_floor() and Input.is_action_just_pressed("ui_accept")  and jumpCount>2:
		jumpCount=0
		#$anim.play("Jump")
	elif is_on_floor() and Input.is_action_just_pressed("ui_accept")  and canSlash==false and jumpCount<2:
		jumpCount+=1
		velocity.y -=clamp(velocity.y, jump, jump)
		if jumpCount==2:
			$anim.play("DoubleJump")
		else:
			$anim.play("Jump")
	elif velocity.y < 0 and velocity.x != 0  and canSlash==false:
		print("JUMPING")
		if jumpCount==2:
			$anim.play("DoubleJump")
		else:
			$anim.play("Jump")
	elif velocity.y > 30 and velocity.x != 0  and isSwooping == false and canSlash==false:
		print("FALLING")
		$anim.play("Fall")
		
	if Input.is_action_just_pressed("ui_sword") and isSwooping==false:
		$anim.play("Sword")
		$Sword/CollisionShape2D.disabled= false
		canSlash= true
		if is_on_floor() and canSlash==true:
			$anim.play("Sword")
		elif velocity.y < 0 and velocity.x!=0 and canSlash == true:
			$anim.play("Sword")
		elif velocity.y > 0 and velocity.x!=0 and canSlash == true:
			$anim.play("Sword")
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)


	
func hurt(damage):
	lives -=damage
	var red = hurtScreen.instance()
	add_child(red)
	if lives <=0 :
		get_tree().reload_current_scene()
	if velocity.x >=0:
		velocity.y=-73
		velocity.x=-53
	elif velocity.x<=0:
		velocity.y=-73
		velocity.x=53
		
func coinPickUp():
	
	coinNumber+=1
	PlayerVariables.set_berries(coinNumber)


func _on_anim_animation_finished():
	if $anim.animation == "Sword":
		canSlash= false# Replace with function body.
		$Sword/CollisionShape2D.disabled= true


func _on_BerriesTimer_timeout():
	if lives < 3 and coinNumber > 0:
		lives +=0.25
		coinNumber-=1
		
		# Replace with function body.
