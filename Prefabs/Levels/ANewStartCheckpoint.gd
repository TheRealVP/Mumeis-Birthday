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


func _on_ANewStartCheckpoint_body_entered(body):
	if PlayerVariables.anewstart_reached==false and body.name=="Player":
		PlayerVariables.set_anewstart_reached()
		print("here we are")
		$anim.play("reached") 
		yield(get_node("anim"), "animation_finished")
		queue_free()
