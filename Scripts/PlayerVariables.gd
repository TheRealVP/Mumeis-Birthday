extends Node

var lives = 3
var berries = 0
var current_scene = null
var exit_point = 0
var bonus0completed = false
var main_room_key = false
var checkpoint_reached = false
var anewstart_reached = false
var red_memory_found = false
var blue_memory_found = false
var green_memory_found = false
var red_memory_placed = false
var blue_memory_placed = false
var green_memory_placed = false

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	if current_scene!=null:
		current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instance()

	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)

func set_lives(newLives):
	lives = newLives
	
func set_berries(newBerries):
	berries =newBerries
	
func set_exit_point(point):
	exit_point=point
	
func set_bonus0done():
	bonus0completed=true
	
func set_red_memory_found():
	red_memory_found=true
	
func set_blue_memory_found():
	blue_memory_found=true
	
func set_green_memory_found():
	green_memory_found=true
	
func set_red_memory_placed():
	red_memory_placed=true
	
func set_blue_memory_placed():
	blue_memory_placed=true
	
func set_green_memory_placed():
	green_memory_placed=true
	
func set_checkpoint_reached():
	checkpoint_reached=true
	
func set_anewstart_reached():
	anewstart_reached=true
	
func a_newer_start():
	var lives = 3
	var berries = 0
	var exit_point = 0
	var bonus0completed = false
	var main_room_key = false
	var checkpoint_reached = false
	var anewstart_reached = false
	var red_memory_found = false
	var blue_memory_found = false
	var green_memory_found = false
	var red_memory_placed = false
	var blue_memory_placed = false
	var green_memory_placed = false
