extends CanvasLayer

onready var player = get_node("../Player")

const HEART_ROW_SIZE= 8
const HEART_OFFSET = 16

func _ready():
	for i in clamp(player.lives, 3, 20):
		var new_heart = Sprite.new()
		new_heart.texture = $Heart.texture
		new_heart.hframes = $Heart.hframes
		$Heart.add_child(new_heart)
		
func _process(delta):
	$coinText.text = String(player.coinNumber)
	
	for heart in $Heart.get_children():
		var index = heart.get_index()
		
		var x = (index % HEART_ROW_SIZE) * HEART_OFFSET
		var y = (index / HEART_ROW_SIZE) * HEART_OFFSET
		heart.position = Vector2(x,y)
		
		var lastHeart = floor(player.lives)
		if index > lastHeart:
			heart.frame = 0
		if index == lastHeart:
			heart.frame = (player.lives - lastHeart) * 4
		if index < lastHeart:
			heart.frame= 4


func _on_GiantOllie_ollie_is_hit():
	$BossProgressBar.value-=1 # Replace with function body.
