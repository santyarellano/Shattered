extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	get_tree().set_debug_collisions_hint(true)
	var messages = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = messages[randi() % messages.size()]
	
	#obtener tamaño del objeto de colision
	var size  = $AnimatedSprite.frames.get_frame($AnimatedSprite.animation, 0).get_size()
	print(size.x)
	
	#crear objeto de colision
	var shape = RectangleShape2D.new()
	shape.extents = (Vector2(size.x/2.5, 10))
	$CollisionShape2D.shape = shape
	
	#posicionar el objeto de colision	
	var anim = $AnimatedSprite.animation

	if(anim == "te_extraño"):
		$CollisionShape2D.position = Vector2(0, 39)
	elif(anim == "emoji" or anim == "emoji_corazon" or anim == "te_amo"):
		$CollisionShape2D.position = Vector2(-5, 39)
	else:
		$CollisionShape2D.position = Vector2(8, 39)
	


func _on_Messages_body_entered(body):
	print(body.get_name())
