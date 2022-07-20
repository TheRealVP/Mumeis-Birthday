extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_ending_theme() # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	$Label.text="\n\n\n\n\n\nV P - Coding and mechanics, designing boring and tough levels, Boss fights, project management\nAnonymous One - Designing cool and fun levels, assistant mechanics work\nSuperappleman - Character design\nCaptain Meow - BGMs\n馬鈴薯 - Tilesets\nHikariKyuubi, akumei - Playtesting\n\nI have been daydreaming on and off about making videogames since the day I first grabbed a Mega Drive controller, many years ago. Even though this dream of mine was never truly dead, it never truly found something that could breathe life into it even though it was the original reason I went down the road of IT. As life goes, it eventually turned a dream I had resigned to give up on. Until now.\n\nNanashi Mumei, thank you for breathing life back to this forgotten dream. I could've never done it without your inspirational presence which made me and the team without whom this would've never been concluded.\nAnd thank you for always doing your level best every time you appear on screen, when you're having fun and otherwise. Have a great day. \nAnd thank you for playing. You, yes you. The person in front of the screen. Thank you whomever you are for reaching up to this point! Don Don." # Replace with function body.


func _on_DevMessage_pressed():
	$AnimationPlayer.play("creditstext") # Replace with function body.
