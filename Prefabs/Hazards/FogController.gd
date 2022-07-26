extends Area2D

onready var fog = $"../Fog"

func _ready():
	fog.visible = false


func _on_FogController_body_entered(body):
	if fog.visible == false:
		fog.visible = true
	else:
		fog.visible = false
