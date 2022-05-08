extends Area2D

export (int) var delay= 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	doExpand()
	
	

func doExpand():
	$anim.play("Expand") # Replace with function body.
	yield(get_node("anim"), "animation_finished")

	doRetract()
	
func doRetract():
	$anim.play("Retract")
	yield(get_node("anim"), "animation_finished")
	yield(get_tree().create_timer(delay),"timeout")
	doExpand()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MetalSpike_body_entered(body):
	if body.has_method("hurt"):
		body.hurt(0.75) # Replace with function body.
