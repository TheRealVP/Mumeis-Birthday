extends Area2D


var transitionfx= load ( "res://Sounds/magic_transition.mp3" )

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BossFight0Transition_body_entered(body):
	if body.name == "Player":
		$SFX.stream= transitionfx
		$SFX.play()
		$anim.play("transition")
		yield(get_node("anim"), "animation_finished")
		PlayerVariables.set_lives(body.lives)
		PlayerVariables.set_berries(body.coinNumber)
				#if spawnPoint>0:
		PlayerVariables.set_exit_point(1)
		PlayerVariables.goto_scene("res://Prefabs/Levels/BossLevel0.tscn" )
