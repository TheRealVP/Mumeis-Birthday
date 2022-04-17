extends Area2D

signal berry_eaten
	

func _on_berry_body_entered(body):
	#body.add_berry()
	emit_signal("berry_eaten")
	$AnimationPlayer.play("Bounce")
	$AudioStreamPlayer.play(0.0)
	set_collision_mask_bit(0,false)
	


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
