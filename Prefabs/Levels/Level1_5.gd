extends Node2D

var keyScene = preload("res://Items/MainRoomKey1.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerVariables.main_room_key==false:
		
		var key= keyScene.instance()
		key.global_position=$KeyPosition.global_position
		get_parent().add_child(key)
