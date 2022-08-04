extends Area2D

export (String) var level = "1"
export (bool) var open = false
export (int) var spawnPoint = 0

func _ready():
	if open==false:
		$anim.play("Closed")
	else:
		$anim.play("Opened")



func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name=="Player":
				PlayerVariables.set_lives(body.lives)
				PlayerVariables.set_berries(body.coinNumber)
				if spawnPoint>0:
					PlayerVariables.set_exit_point(spawnPoint)
				if(get_tree().get_current_scene().filename=="res://Prefabs/Levels/TutorialLevel.tscn"):
					PlayerVariables.goto_scene("res://Prefabs/Levels/TutorialLevel2.tscn" )
				else:
					PlayerVariables.goto_scene("res://Prefabs/Menus/MainMenu.tscn" )
				#get_tree().change_scene("res://Prefabs/Levels/Level" + str(int(level)) + ".tscn" )


func _on_Lever_is_triggered():
	#
	$anim.play("Opened")
