extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerVariables.checkpoint_reached==false:
		PlayerVariables.set_checkpoint_reached()
		$CheckPoint/AnimationPlayer.play("play") 
		yield(get_node("CheckPoint/AnimationPlayer"), "animation_finished")
		$CheckPoint.queue_free()# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
