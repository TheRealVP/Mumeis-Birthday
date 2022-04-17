extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_mud_body_entered(body):
	if(body.get_name() == "mumei"):
		print("in the mud!")
		body.in_the_mud()


func _on_mud_body_exited(body):
	if(body.get_name() == "mumei"):
		body.out_of_the_mud()
