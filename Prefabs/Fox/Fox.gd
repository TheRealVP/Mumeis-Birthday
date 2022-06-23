extends Node2D

export (int) var animation = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if animation == 0:
		$AnimationPlayer.play("sleeping")
	else:  # Replace with function body.
		$AnimationPlayer.play("standing")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
