extends KinematicBody2D

var velocity = Vector2(0,0)
export var direction = -1
var speed = 70
var dying = false
var original_level = self.position.y
var hit=false
var swooped=false
var coinScene = preload("res://Prefabs/Coin/Coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():

	original_level = self.position.y
	#$AnimatedSprite.play("default") # Replace with function body.
	if(direction ==-1):
		$Sprite.flip_h = true

func _physics_process(delta):
	if self.position.y < original_level and hit==true:
		hit=false
	elif self.position.y >= original_level and hit==true:
		velocity.x=0
		velocity.y=-speed*2
	else:
		if is_on_wall():
			direction=direction*-1
			$Sprite.flip_h = not $Sprite.flip_h
		elif is_on_floor():
			velocity.x=0
			velocity.y=-speed*2
			hit=true
		velocity.x=speed*direction
		velocity.y=0
		
		if $raycast.is_colliding():
			if $raycast.get_collider().name == "Player" and hit == false and swooped == false:
				#swooped=true
				$SwoopTimer.start()
				velocity.x=0
				velocity.y=speed*2
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
	var coin = coinScene.instance()
	coin.global_position= global_position
	get_tree().get_root().add_child(coin)


func _on_SwoopTimer_timeout():
	print("RELOADING")
	swooped=false # Replace with function body.
