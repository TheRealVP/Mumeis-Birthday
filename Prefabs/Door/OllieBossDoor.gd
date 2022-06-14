extends Area2D


export (String) var level = "1"
export (bool) var open = false
export (int) var spawnPoint = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if open==false:
		$anim.play("Closed")
	else:
		$anim.play("Opened")# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
