extends Area2D

var coinScene = preload("res://Prefabs/Coin/Coin.tscn")

var lives = 3

func _on_Crates_area_entered(area):
	if area.is_in_group("Sword"):
		lives -=1
		$anim.play("Slashed")
		yield(get_node("anim"), "animation_finished")
		$anim.play("Active")
		if lives <=0:
			$anim.play("Destroyed")
			yield(get_node("anim"), "animation_finished")
			onDestroyed()
			queue_free()
			
func onDestroyed():
	var coin = coinScene.instance()
	coin.global_position= global_position
	get_tree().get_root().add_child(coin)
