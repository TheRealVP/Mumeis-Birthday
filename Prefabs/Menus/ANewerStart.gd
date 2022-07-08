extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ANewerStart_pressed():
	PlayerVariables.a_newer_start()
	PlayerVariables.goto_scene("res://Prefabs/Menus/MainMenu.tscn" ) # Replace with function body.
