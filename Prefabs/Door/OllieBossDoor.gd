extends Area2D


export (String) var level = "1"
export (bool) var open = false
export (int) var spawnPoint = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if open==false:
		$anim.play("Closed")
	else:
		$anim.play("Opened")# Replace with function body.


func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name=="Player":
				PlayerVariables.set_lives(body.lives)
				PlayerVariables.set_berries(body.coinNumber)
				#if spawnPoint>0:
				PlayerVariables.set_exit_point(spawnPoint)
				PlayerVariables.goto_scene("res://Prefabs/Levels/Level3_1.tscn" )


func _on_GiantOllie_ollie_is_dead():
	$anim.play("Opened") # Replace with function body.
