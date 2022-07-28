extends Area2D

var transitionfx= load ( "res://Sounds/magic_transition.mp3" )

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_KroniiPort_body_entered(body):
	if body.name=="Player":
		$SFX.stream= transitionfx
		$SFX.play()
		$anim.play("kroniiport")
		yield(get_node("anim"), "animation_finished")
		PlayerVariables.set_lives(body.lives)
		PlayerVariables.set_berries(body.coinNumber)
		PlayerVariables.goto_scene("res://Prefabs/Levels/BossLevel2.tscn" )
 # Replace with function body.
