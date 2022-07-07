extends StaticBody2D


onready var sprite = $Sprite
onready var timer = $Timer

var harvested = false
export var regrow_delay = 60

signal harvest
signal regrow


func _ready():
	sprite.frame = 1
	timer.set_wait_time(regrow_delay)


func _on_Plant_area_entered(area):
	if area.is_in_group("Sword") and harvested == false:
		harvested = true
		timer.start()
		sprite.frame = 0
		emit_signal("harvest")
		

func _on_Timer_timeout():
	sprite.frame = 1
	harvested = false
	emit_signal("regrow")
