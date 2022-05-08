extends Area2D

func _ready():
	$anim.play("Respawn")


func _on_BreakingPlatform_body_entered(body):
	if body.name == "Player":
		yield(get_tree().create_timer(0.5), "timeout")
		$anim.play("Destroyed")
		yield(get_node("anim"), "animation_finished")
		queue_free()
