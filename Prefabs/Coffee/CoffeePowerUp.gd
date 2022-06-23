extends Node2D

onready var timer = $Timer
onready var pb = $Panel/ProgressBar
onready var player = get_node("..")


var caffeine = 2


func _ready():
	timer.wait_time = pb.value
	player.speed = player.speed * caffeine
	player.maxSpeed = player.maxSpeed * caffeine
	player.invulnerable = true


func _process(_delta):
	 #print(timer.time_left)
	 pb.value = timer.time_left


func _on_Timer_timeout():
	player.speed = player.speed / caffeine
	player.maxSpeed = player.maxSpeed / caffeine
	player.invulnerable = false
	queue_free()
