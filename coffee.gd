extends Area2D

signal coffee_consoomed
	

func _on_coffee_body_entered(body):
	#body.add_berry()
	body.set_caffeinated()
	emit_signal("coffee_consoomed")
	$AnimationPlayer.play("consoom")
	#$AudioStreamPlayer.play(0.0)
	set_collision_mask_bit(0,false)
	


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
