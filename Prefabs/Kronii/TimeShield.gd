extends Node2D

onready var BULLET_SCENE = preload("res://Prefabs/Bullet/BlueBullet.tscn")

var lazor = load( "res://Sounds/lazor.mp3" )

export (float) var d := 0.0
var radius := 40.0
var speed := 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	 # Replace with function body.



func _process(delta):
	d+=delta
	
	position = Vector2(sin(d*speed) * radius,cos(d*speed)*radius)+get_parent().get_parent().get_global_position()

func fire():
	print("You spin me right round")


func _on_Timer_timeout():
	randomize()
	var rng = randi()%100
	var bullet= BULLET_SCENE.instance()
	
	bullet.position = self.position
	bullet.look_vec = Vector2(sin(d*speed) * radius,cos(d*speed)*radius)*rng +get_parent().get_parent().get_global_position()
	#spawn bullet
	#add player to params
	#do aim from bullet script
	get_parent().add_child(bullet) # Replace with function body.
	$SFX.stream= lazor
	$SFX.play()
	yield(get_tree().create_timer(1),"timeout")
	$SFX.stop()
