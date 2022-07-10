extends Area2D


func _ready():
	#if PlayerVariables.bonus0completed==false:
		$anim.play("Opened") # Replace with function body.
	#else:
	#	$anim.play("Closed")

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name=="Player":
				PlayerVariables.set_lives(body.lives)
				PlayerVariables.set_berries(body.coinNumber)
				#if spawnPoint>0:
				PlayerVariables.set_exit_point(0)
				PlayerVariables.goto_scene("res://Prefabs/Levels/Bonus/BonusLevel2.tscn" )
