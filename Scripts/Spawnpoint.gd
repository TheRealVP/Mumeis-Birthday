extends Position2D


export (PackedScene) var platform

var currentPlatform = null
var spawnNext = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$spawnTimer.connect("timeout", self, "on_spawn_timer_timeout")
	call_deferred("SpawnPlatform")

func SpawnPlatform():
	currentPlatform = platform.instance()
	get_parent().add_child(currentPlatform)
	currentPlatform.global_position = global_position
	
func checkPlatform():
	if !is_instance_valid(currentPlatform):
		if spawnNext:
			SpawnPlatform()
			spawnNext = false
		else:
			spawnNext = true
func on_spawn_timer_timeout():
	checkPlatform()
	
