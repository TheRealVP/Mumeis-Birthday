extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BackToShaftArea_body_entered(body):
	if body.name == "Player":
		PlayerVariables.set_lives(body.lives)
		PlayerVariables.set_berries(body.coinNumber)
				#if spawnPoint>0:
		PlayerVariables.set_exit_point(1)
		PlayerVariables.goto_scene("res://Prefabs/Levels/Level3_4.tscn" ) # Replace with function body.
