extends CanvasLayer


var berries = 0
var hearts = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	$berries.text= String(berries)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$caffeine.text= String($CaffeineTime.time_left)
	
func _physics_process(delta):
	if berries== 100:
		get_tree().change_scene("res://Level1.tscn")

func _on_berry_eaten():
	berries = berries +1
	_ready() # Replace with function body.


func _on_coffee_coffee_consoomed():
	print("CONSOOM") # Replace with function body.
	$CaffeineTime.start()

func _on_CaffeineTime_timeout():
	$CaffeineTime.stop() # Replace with function body.


func _on_Heart_heart_taken():
	hearts+=1
	print("splosh") # Replace with function body.
	if(hearts==3):
		$heart3.visible=true
	elif(hearts==2):
		$heart2.visible=true



func _on_mumei_struck():
	hearts-=1
	print("splosh") # Replace with function body.
	if(hearts==2):
		$heart3.visible=false
	elif(hearts==1):
		$heart2.visible=false # Replace with function body.
