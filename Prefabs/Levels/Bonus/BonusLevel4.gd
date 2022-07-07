extends Node2D


var total_wheat = 127
var harvested_wheat = 0

onready var crops = get_tree().get_nodes_in_group("Wheat")  
onready var door = $Stuff/SimpleDoor
onready var sound = $SuccessSound

var success = load("res://Sounds/success1.mp3")
var scythe = load("res://Sounds/scissors-paper1.mp3")

func _ready():
	for Wheat in crops: 
		Wheat.connect("harvest", self, "wheat_harvested")
		Wheat.connect("regrow", self, "wheat_regrowed")
		

func wheat_harvested():
	harvested_wheat += 1
	sound.stream = scythe
	sound.play()
	if harvested_wheat == total_wheat:
		door._on_Lever_is_triggered()
		sound.stream = success
		sound.play()

func wheat_regrowed():
	harvested_wheat -= 1
	


