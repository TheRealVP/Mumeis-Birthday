extends Node


var main_menu_theme =load("res://Sounds/Mumei_Game_BGM_Main_Theme.mp3")
var exploration_theme= load("res://Sounds/Mumei_Game_BGM_Exploration_Theme.mp3")
var ending_theme= load("res://Sounds/Mumei_Game_BGM_Ending_Theme.mp3")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func play_main_theme():
	$Music.stream = main_menu_theme
	$Music.play()
func play_exploration_theme():
	$Music.stream = exploration_theme
	$Music.play()
func play_ending_theme():
	$Music.stream = ending_theme
	$Music.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
