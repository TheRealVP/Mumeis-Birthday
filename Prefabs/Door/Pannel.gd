extends Area2D



signal all_found

# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerVariables.red_memory_found == true and PlayerVariables.red_memory_placed==true:
		$R/RedPlayer.play("turnon") # Replace with function body.
	if PlayerVariables.green_memory_found == true and PlayerVariables.green_memory_placed==true:
		$G/GreenPlayer.play("turnon")
	if PlayerVariables.blue_memory_found == true and PlayerVariables.blue_memory_placed==true:
		$B/BluePlayer.play("turnon")

func _on_Pannel_body_entered(body):
	if body.name=="Player":
		if PlayerVariables.red_memory_found == true and PlayerVariables.red_memory_placed==false:
			PlayerVariables.set_red_memory_placed()
			$R/RedPlayer.play("turnon")
		if PlayerVariables.green_memory_found == true and PlayerVariables.green_memory_placed==false:
			PlayerVariables.set_green_memory_placed()
			$G/GreenPlayer.play("turnon")
		if PlayerVariables.blue_memory_found == true and PlayerVariables.blue_memory_placed==false:
			PlayerVariables.set_blue_memory_placed()
			$B/BluePlayer.play("turnon")
		if PlayerVariables.red_memory_placed==true and PlayerVariables.green_memory_placed==true and PlayerVariables.blue_memory_placed==true:
			emit_signal("all_found")
