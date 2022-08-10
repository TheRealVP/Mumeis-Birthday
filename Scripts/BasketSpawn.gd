extends Position2D

var basketScene = preload("res://Prefabs/Basket/Basket.tscn"  )
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var value = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerVariables.find_basket(value)==false:
		print("Spawning basket with value ", 1)
		var basket= basketScene.instance()
		#basket.position= self.position
		basket.value=value
		print(basket.position)
		add_child(basket)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
