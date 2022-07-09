extends Area2D


func _ready():
	if PlayerVariables.red_memory_placed==true and PlayerVariables.green_memory_placed==true and PlayerVariables.blue_memory_placed==true:
		$anim.play("Opened")
	else:
		$anim.play("Closed")




func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name=="Player":
				PlayerVariables.set_lives(body.lives)
				PlayerVariables.set_berries(body.coinNumber)
				#if spawnPoint>0:
				PlayerVariables.set_exit_point(1)
				PlayerVariables.goto_scene("res://Prefabs/Levels/Level3_6.tscn" )
				#get_tree().change_scene("res://Prefabs/Levels/Level" + str(int(level)) + ".tscn" )


func _on_Lever_is_triggered():
	#
	$anim.play("Opened")


func _on_Pannel_all_found():
	$anim.play("Opened") # Replace with function body.
