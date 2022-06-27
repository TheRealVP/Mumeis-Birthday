extends RigidBody2D


export (int) var speed = 1
export var length = Vector2()

var moving = false
var triggered = false
var repeat = false

func _process(_delta):
	if moving == false and triggered == true:
		move()
		moving = true
	elif repeat == true:
		move()
		moving = true
		repeat = false


func move():
	$Tween.interpolate_property(
		self,
		"position",
		global_position,
		global_position+length,
		speed,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	$Tween.start()
	


func _on_Tween_tween_completed(object, _key):
	length*=-1 # Replace with function body.
	repeat = true

func _on_Area2D_body_entered(_body):
	triggered = true


func _on_Area2D_body_exited(_body):
	triggered = false


func _on_Tween_tween_all_completed():
	moving = false
