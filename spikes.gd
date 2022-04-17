extends Area2D

func _ready():
	$AnimatedSprite.play("default")

func _on_spikes_body_entered(body):
	if(body.get_name() == "mumei"):
		$AnimatedSprite.play("spring")
		body.ouch()
		


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("default")
