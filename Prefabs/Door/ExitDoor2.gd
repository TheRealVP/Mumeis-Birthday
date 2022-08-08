extends Area2D

func _ready():
	$anim.play("Opened")


func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name=="Player":
				MusicController.play_exploration_theme()
				PlayerVariables.set_lives(body.lives)
				PlayerVariables.set_berries(body.coinNumber)
				PlayerVariables.set_exit_point(4)
				PlayerVariables.goto_scene("res://Prefabs/Levels/Level3_2.tscn" )
				#get_tree().change_scene("res://Prefabs/Levels/Level" + str(int(level)) + ".tscn" )
