extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_main_theme()
	randomize()
	var rng = randi()%21 # Replace with function body.
	if rng == 1:
		$UnwantedAdvice.text="Not every enemy can generate the momentum to hurt you on contact."
	elif rng == 2:
		$UnwantedAdvice.text="Sometimes it pays to retrace your steps and pick up some berries."
	elif rng == 3:
		$UnwantedAdvice.text="Every level has been playtested and beaten. You can do it!"
	elif rng == 4:
		$UnwantedAdvice.text="There are 220 species of owls in the world. Lots of ideas for alternative outfits huh? ;D"
	elif rng == 5:
		$UnwantedAdvice.text="Owl-like birds, like Berruornis and Ogygoptynx, lived 60 million years ago. Owls are one of the most ancient types of bird, along with chickens, turkeys, and pheasants."
	elif rng == 6:
		$UnwantedAdvice.text="If a human were to turn their head like an owl, they would suffer traumatic arterial injuries and blood flow interruptions.["
	elif rng == 7:
		$UnwantedAdvice.text="You can gain a lot of forward momentum if you run and swoop near the floor. Be careful not to skate away."
	elif rng == 8:
		$UnwantedAdvice.text="An owl has the best night vision of any animal."
	elif rng == 9:
		$UnwantedAdvice.text="There may be more than one route to progress if you're observant."
	elif rng == 10:
		$UnwantedAdvice.text="Mumei is cute, cool and dorky. And can shank you without a second thought."
	elif rng == 11:
		$UnwantedAdvice.text="Don't believe the lies of the ticket-selling paper bag."
	elif rng == 12:
		$UnwantedAdvice.text="Yagoo is the undisputed best girl of Hololive. Sorry Mumei, it's just the truth..."
	elif rng == 13:
		$UnwantedAdvice.text="There is no cow level."
	elif rng == 14:
		$UnwantedAdvice.text="An owl's eye color indicates when it prefers to hunt. Owls with orange eyes are crepuscular (active during twilight); owls with dark brown or black eyes are nocturnal; and yellow eyes indicate owls that are diurnal."
	elif rng == 15:
		$UnwantedAdvice.text="An owl's eyes take up so much space inside its skull that there is not much room for its brain."
	elif rng == 16:
		$UnwantedAdvice.text="Nanashi Mumei is the favorite VTuber of most of the dev team. So you better do better next time. We're watching..."
	elif rng == 17:
		$UnwantedAdvice.text="Observe the enemies' patterns. Timing is everything."
	elif rng == 18:
		$UnwantedAdvice.text="Enemies that can't be beaten in a single blow will often flinch and can't hurt you during that time."
	elif rng == 19:
		$UnwantedAdvice.text="Buffalo buffalo buffalo buffalo buffalo buffalo buffalo is a grammatically correct sentence."
	elif rng == 20:
		$UnwantedAdvice.text="If you enjoyed this game, subscribe to Nanashi Mumei's channel and get to work on smashing all those like buttons!"
	else:
		$UnwantedAdvice.text="Just don't die next time! :D"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
