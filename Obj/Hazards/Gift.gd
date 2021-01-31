extends Sprite

func _on_DamageArea_body_entered(body):
	if(body.get_name() == "Player"):
		body.dano()
		body.bounceGift()
