extends Node2D

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
