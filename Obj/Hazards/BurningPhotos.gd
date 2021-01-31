extends AnimatedSprite


func _on_FireArea_body_entered(body):
	if(body.get_name() == "Player"):
		body.dano()
		body.bouncePhotos()
