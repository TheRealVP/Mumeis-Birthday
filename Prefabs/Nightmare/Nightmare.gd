extends StaticBody2D

onready var BULLET_SCENE = preload("res://Prefabs/Bullet/Bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dead= load("res://Sounds/monstercry.wav" )
var lazor = load( "res://Sounds/lazor.mp3" )
var target = null
var dying = false
# Called when the node enters the scene tree for the first time.
func _ready():
	doCharge()
	
	

func doCharge():
	$anim.play("Charge") # Replace with function body.
	yield(get_node("anim"), "animation_finished")
	if target!=null and dying==false:
		fire()
	doFade()
	
func doFade():
	$anim.play("Fade")
	yield(get_node("anim"), "animation_finished")
	$SFX.stop()
	doCharge()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func fire():
	print("Firing")
	$SFX.stream= lazor
	$SFX.play()
	var bullet= BULLET_SCENE.instance()
	
	bullet.position = self.position
	bullet.player = target
	bullet.look_vec = target.position - self.position
	#spawn bullet
	#add player to params
	#do aim from bullet script
	get_parent().add_child(bullet)

func _on_Area2D_body_entered(body):
	if body.name=="Player":
		
		target = body
		#fire()
		 # Replace with function body.


func _on_Area2D_body_exited(body):
	if body.name=="Player":
		target = null # Replace with function body.


func _on_hitbox_area_entered(area):
	if area.is_in_group("Sword"):
		dying=true
		$SFX.stream= dead
		$SFX.play()
		$anim.play("death")
		yield(get_node("anim"), "animation_finished")
		queue_free() # Replace with function body.
