extends AnimatedSprite

export (PackedScene) var Letter
export var letter_speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	$LetterTimer.start()



func _on_LetterTimer_timeout():
	var letter = Letter.instance()
	add_child(letter)
	
	letter.position = $LetterSpawn.position
	
	letter.linear_velocity = Vector2(letter_speed, 0)
