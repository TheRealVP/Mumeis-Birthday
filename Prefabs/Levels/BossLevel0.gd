extends Node2D

onready var bossNightmare = preload("res://Prefabs/Nightmare/BossNightmare.tscn")

var spawnpoints = [false, false, false, false]

var transitionfx= load ( "res://Sounds/magic_transition.mp3" )

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_boss_theme()
	var counter=0
	while counter <2:
		randomize()
		var rng = randi()%4
		print(rng)
		if spawnpoints[rng]==false:
			spawn_nightmare_fuel(rng)
			
			counter +=1 # Replace with function body.


func spawn_nightmare_fuel(point):
	spawnpoints[point]=true
	var skull= bossNightmare.instance()
	skull.spawnpoint=point
	if point==0:
		skull.global_position = $nightmare1.position
		
		add_child(skull)
		skull.connect("died",self,"_on_BossNightmare_died")
	elif point==1:
		skull.global_position = $nightmare2.position
		add_child(skull)
		skull.connect("died",self,"_on_BossNightmare_died")
	elif point==2:
		skull.global_position = $nightmare3.position
		add_child(skull)
		skull.connect("died",self,"_on_BossNightmare_died")
	elif point==3:
		skull.global_position = $nightmare4.position
		add_child(skull)
		skull.connect("died",self,"_on_BossNightmare_died")
	
	
	#add_child(skull)
	print(skull.position)

	
func find_missing_point(point):
	for number in spawnpoints.size():
		if spawnpoints[number]==false and number!=point:
			return number
		
func _on_BossNightmare_died(point):
	print("Nightmare died!")
	
	$GUI/BossProgressBar.value -=1
	if $GUI/BossProgressBar.value > 0:
		spawn_nightmare_fuel(find_missing_point(point))
	else:
		MusicController.play_exploration_theme()
		$FlashArea/SFX.stream= transitionfx
		$FlashArea/SFX.play()
		$FlashArea/anim.play("flashing")
		yield($FlashArea/anim, "animation_finished")
		PlayerVariables.set_lives($Player.lives)
		PlayerVariables.set_berries($Player.coinNumber)
	#if spawnPoint>0:
		PlayerVariables.set_exit_point(0)
		PlayerVariables.goto_scene("res://Prefabs/Levels/Level2_1.tscn" )
	spawnpoints[point]=false
