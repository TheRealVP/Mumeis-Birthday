extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var transitionfx= load ( "res://Sounds/magic_transition.mp3" )
var target=null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GiantOllie_ollie_is_dead():
	$SFX.stream = transitionfx
	$SFX.play()
	$anim.play("flashing")
	yield(get_node("anim"), "animation_finished")
	PlayerVariables.set_lives(target.lives)
	PlayerVariables.set_berries(target.coinNumber)
	#if spawnPoint>0:
	PlayerVariables.set_exit_point(0)
	PlayerVariables.goto_scene("res://Prefabs/Levels/Level3_1.tscn" ) # Replace with function body.


func _on_FlashArea_body_entered(body):
	if body.name=="Player":
		
		target = body # Replace with function body.
