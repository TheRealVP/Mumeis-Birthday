extends KinematicBody2D

onready var BULLET_SCENE = preload("res://Prefabs/Bullet/Bullet.tscn")

var speed = 20
var velocity = Vector2.ZERO
var direction= Vector2.RIGHT
var gravity = 500
var target = null

signal ollie_is_hit

var coinScene = preload("res://Prefabs/Coin/Coin.tscn")

var lives = 30

func _process(delta):
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
			lives-=1
			emit_signal("ollie_is_hit")
			$anim.play("Hurt")
			yield(get_node("anim"), "animation_finished")
			$anim.play("Run")
			if lives <=0:
				$anim.play("Dead")
				yield(get_node("anim"), "animation_finished")
				onDestroyed()
				queue_free()
		elif body.has_method("hurt"):
			body.hurt(0.5) # Replace with function body.


func _on_hitBox_area_entered(area):
	if area.is_in_group("Sword"):
		lives -=1
		emit_signal("ollie_is_hit")
		$anim.play("Hurt")
		yield(get_node("anim"), "animation_finished")
		direction *=-1
		$anim.play("Run")
		if lives <=0:
			$anim.play("Dead")
			yield(get_node("anim"), "animation_finished")
			onDestroyed()
			queue_free()
			
func onDestroyed():
	var coin = coinScene.instance()
	coin.global_position= global_position
	get_tree().get_root().add_child(coin)

func fire():
	var bullet= BULLET_SCENE.instance()
	var bullet2= BULLET_SCENE.instance()
	
	bullet.position = self.position
	bullet.position.x -=6
	bullet.position.y -=5
	bullet.player = target
	bullet.look_vec = target.position - self.position
	
	bullet2.position = self.position
	bullet2.position.x +=6
	bullet2.position.y -=5
	bullet2.player = target
	bullet2.look_vec = target.position - self.position

	get_parent().add_child(bullet)
	get_parent().add_child(bullet2)


func _on_Timer_timeout():
	if target!=null:
		fire()# Replace with function body.


func _on_targetArea_body_entered(body):
	if body.name=="Player":
		target = body
	 # Replace with function body.


func _on_targetArea_body_exited(body):
	if body.name=="Player":
		target = null # Replace with function body.
