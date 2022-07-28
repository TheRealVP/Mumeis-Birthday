extends KinematicBody2D

var speed = 40
var velocity = Vector2.ZERO
var direction= Vector2.RIGHT
var gravity = 500

var coinScene = preload("res://Prefabs/Coin/Coin.tscn")
var dead= load("res://Sounds/monstercry.wav" )

var lives = 3

func _process(delta):
	if $anim.get_assigned_animation() != "Hurt":
		velocity.x = speed*direction.x
	
	if lives <=0:
		velocity = Vector2.ZERO
	
	velocity.y += gravity * delta
	velocity= move_and_slide(velocity, Vector2.UP)
	$Sprite.flip_h = false if direction.x < 0 else true

func _ready():
	$PathDetector.connect("area_entered",self, "onPathEntered")

func onPathEntered(_area2d):
	if _area2d.is_in_group("Pathpoint"):
		direction *=-1


func _on_hitBox_body_entered(body):
	if body.name=="Player":
		if body.isSwooping==true:
			lives-=2
			$anim.play("Hurt")
			yield(get_node("anim"), "animation_finished")
			$anim.play("Run")
			if lives <=0:
				$SFX.stream= dead
				$SFX.play()
				$anim.play("Dead")
				yield(get_node("anim"), "animation_finished")
				onDestroyed()
				queue_free()
		elif body.has_method("hurt"):
			body.hurt(0.5) # Replace with function body.


func _on_hitBox_area_entered(area):
	if area.is_in_group("Sword"):
		lives -=1
		var player = get_node("../Player")
		self.position.x
		print(player.position.x)
		if player.position.x >=self.position.x:
			velocity.y=-73
			velocity.x=-53 #these two were flipped
		elif  player.position.x<=self.position.x:
			velocity.y=-73
			velocity.x=53
		$anim.play("Hurt")
		yield(get_node("anim"), "animation_finished")
		direction *=-1
		$anim.play("Run")
		if lives <=0:
			$SFX.stream= dead
			$SFX.play()
			$anim.play("Dead")
			yield(get_node("anim"), "animation_finished")
			onDestroyed()
			queue_free()
			
func onDestroyed():
	var coin = coinScene.instance()
	coin.global_position= global_position
	get_tree().get_root().add_child(coin)
