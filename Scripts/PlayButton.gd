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


func _on_Button_pressed():
	PlayerVariables.set_lives(3)
	PlayerVariables.set_berries(0)
	if (PlayerVariables.anewstart_reached==true):
		MusicController.play_exploration_theme()
		PlayerVariables.set_exit_point(2)
		PlayerVariables.goto_scene("res://Prefabs/Levels/Level3_6.tscn" )
	elif(PlayerVariables.checkpoint_reached==false):
		if (PlayerVariables.game_started == false):
			PlayerVariables.goto_scene("res://Prefabs/Intro/Intro.tscn");
		else:
			MusicController.play_exploration_theme() 
			PlayerVariables.goto_scene("res://Prefabs/Levels/Level0.tscn" )
	else:
		MusicController.play_exploration_theme()
		PlayerVariables.goto_scene("res://Prefabs/Levels/Level3_3.tscn" )
		 # Replace with function body.

