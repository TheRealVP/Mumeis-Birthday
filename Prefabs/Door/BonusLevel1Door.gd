extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerVariables.bonus0completed==false:
		$anim.play("Opened") # Replace with function body.
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
				PlayerVariables.set_exit_point(0)
				PlayerVariables.goto_scene("res://Prefabs/Levels/Bonus/BonusLevel0.tscn" )
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
