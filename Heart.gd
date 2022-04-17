extends Area2D


signal heart_taken
	

func _on_Heart_body_entered(body):
	#body.add_berry()
	emit_signal("heart_taken")
	queue_free()
	set_collision_mask_bit(0,false)
	


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
