extends RigidBody2D


onready var cheese = load("res://Prefabs/Baerat/Cheese.tscn")

func _on_CheeseLever_is_triggered():
	var cheese_instance = cheese.instance()
	add_child(cheese_instance)
	cheese_instance.global_position = Vector2(950,170)
