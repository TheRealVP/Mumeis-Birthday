extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(PlayerVariables.exit_point)
	if PlayerVariables.exit_point==1:
		$Player.global_position= $exitpoint1.global_position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
