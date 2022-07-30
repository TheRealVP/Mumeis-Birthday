extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bodies = get_overlapping_bodies()
	for boddhi in bodies:
		if boddhi.name=="Player":
			$anim.play("firetriggered")
			yield(get_node("anim"), "animation_finished")


func _on_FakeBlock_body_entered(body):
	var bodies = get_overlapping_bodies()
	#for boddhi in bodies:
	#	if boddhi.name=="Player":
	#		$anim.play("firetriggered")
	#		yield(get_node("anim"), "animation_finished") # Replace with function body.
