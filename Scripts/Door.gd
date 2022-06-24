extends Area2D

export (int) var level = 1

func _ready():
	$anim.play("Idle")



func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name=="Player":
				PlayerVariables.set_lives(body.lives)
				PlayerVariables.set_lives(clamp(body.coinNumber, 3, 10))
				PlayerVariables.set_bonus0done()
				PlayerVariables.exit_point=1
				PlayerVariables.goto_scene("res://Prefabs/Levels/Level2_1.tscn" )
				#get_tree().change_scene("res://Prefabs/Levels/Level" + str(int(level)) + ".tscn" )


func _on_Lever_is_triggered():
	$anim.play("Active")
	yield(get_node("anim"), "animation_finished")
	$anim.play("Opened")
