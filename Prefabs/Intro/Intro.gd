extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("part1")
	yield(get_node("AnimationPlayer"), "animation_finished")
	MusicController.play_exploration_theme() 
	PlayerVariables.game_started=true
	PlayerVariables.goto_scene("res://Prefabs/Levels/Level0.tscn" )

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
