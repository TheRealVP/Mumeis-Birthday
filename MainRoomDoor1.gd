extends Area2D

export (String) var level = "1"
export (bool) var open = false
export (int) var spawnPoint = 0


func _ready():
	$anim.play("Closed")


func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name=="Player" and PlayerVariables.main_room_key==true:
				PlayerVariables.set_lives(body.lives)
				PlayerVariables.set_berries(body.coinNumber)
					#if spawnPoint>0:
				PlayerVariables.set_exit_point(spawnPoint)
				PlayerVariables.goto_scene("res://Prefabs/Levels/Level" + level + ".tscn" )
				#get_tree().change_scene("res://Prefabs/Levels/Level" + str(int(level)) + ".tscn" )
			else:
				$info.text="Door is Locked!"
				var t = Timer.new()
				t.set_wait_time(4)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				$info.text=""





func _on_MainRoomDoor1_body_entered(body):
	if body.name=="Player" and PlayerVariables.main_room_key==true:
		$anim.play("Opened") # Replace with function body.
