extends Area2D

export (int) var level = 1

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name=="Player":
				PlayerVariables.set_lives(body.lives)
				PlayerVariables.set_lives(body.coinNumber)
				PlayerVariables.exit_point=0
				get_tree().change_scene("res://Prefabs/Levels/Level" + str(int(level)) + ".tscn" )
