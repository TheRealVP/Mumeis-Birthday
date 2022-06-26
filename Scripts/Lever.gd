extends Area2D

signal is_triggered

var triggered = false

func _process(delta):
	var areas = get_overlapping_areas()
	for area in areas:
		if area.is_in_group("Sword"):
			if triggered == false:
				$anim.play("Hit")
				yield(get_node("anim"), "animation_finished")
				$anim.play("Activated")
				emit_signal("is_triggered")
				triggered = true
		else:
			$anim.play("Idle")
