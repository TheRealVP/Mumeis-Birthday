extends RigidBody2D


export (int) var speed = 1
export var length = Vector2()

var moving = false
var triggered = false
var pos = 1
var stop = false


func _process(_delta):
	if stop == true:
		pass
	elif triggered == false:
		pass
	elif moving == false:
		move_platform()
		moving = true


func move_platform():
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
	pos *= -1
	

func _on_Tween_tween_completed(object, _key):
	if stop == false:
		length *= -1 
		moving = false
		if pos == 1:
			triggered = false


func _on_Area2D_body_entered(body):
	if body.has_method("move_platform"):
		pass
	else:
		triggered = true
		print(body)
		if body.is_in_group("Rat"):
			move_platform()
			stop = true
			print("rrrrrrat")





