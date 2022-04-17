extends Area2D

export(PackedScene) var AMMO: PackedScene = preload("res://Paperball.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var facing=1
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default") # Replace with function body.
	if facing==-1:
		$AnimatedSprite.flip_h=true


func _on_topchecker_body_entered(body):
	if(body.get_name() == "mumei"):
		body.add_bump()
		queue_free() # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	var ammo = AMMO.instance()
	ammo.facing= facing
	ammo.velocity.y=-400
	ammo.global_position = self.global_position
	#add_child_below_node(get_tree().get_root().get_node("Level1"),ammo)
	get_tree().current_scene.add_child(ammo)

