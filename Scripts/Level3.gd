extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerVariables.exit_point==1:
		$Player.global_position= $exitpoint1.global_position
	
