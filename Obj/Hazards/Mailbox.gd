extends AnimatedSprite

export (PackedScene) var Letter

# Called when the node enters the scene tree for the first time.
func _ready():
	$LetterTimer.start()



func _on_LetterTimer_timeout():
	var letter = Letter.instance()
	add_child(letter)
	
	letter.position = $LetterSpawn.position
	
	letter.linear_velocity = Vector2(-letter.speed, 0)
