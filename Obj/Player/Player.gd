extends KinematicBody2D


# Declare member variables here. Examples:
export var walk_spd = 100
export var jump_power = -100
export var gravity = 1200
var right = 0
var left = 0
var walk_vel = 0
var velocity = Vector2()
var jumping = false


# Called when the node enters the scene tree for the first time.
func _ready():
	#position.x = 400
	#position.y = 300
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !jumping:
		if velocity.x != 0:
			$AnimatedSprite.play("hand_wlk")
			if velocity.x < 0:
				$AnimatedSprite.flip_h = true
			elif velocity.x > 0:
				$AnimatedSprite.flip_h = false
		elif velocity.x == 0:
			$AnimatedSprite.play("hand_idle")
			$AnimatedSprite.stop()
	else:
		$AnimatedSprite.play("hand_jump")
		if velocity.x < 0:
			$AnimatedSprite.flip_h = true
		elif velocity.x > 0:
			$AnimatedSprite.flip_h = false
	
func get_input():
	# Walking
	if Input.is_action_pressed("ui_right"):
		right = 1
	else:
		right = 0
		
	if Input.is_action_pressed("ui_left"):
		left = 1
	else:
		left = 0
		
	var jump_key = Input.is_action_just_pressed("ui_select")
	if jump_key and is_on_floor():
		jumping = true
		velocity.y = jump_power
		
	velocity.x = walk_spd*(right - left)
	
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor() && velocity.y >= 0:
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
func dano():
	set_modulate(Color(1,0.3,0.3,0.3))
	$Timer.start()
	bounceMail()
	print("quitar vida")

#Esta función es para que rebote si colisiona
func bounceMail():
	velocity.y = jump_power * .7
	velocity = move_and_slide(velocity, Vector2(0, -1))
	

#Esta funcion es para cambiarle el color por unos segundos si colisiona con una carta(Mail)
func _on_Timer_timeout():
	set_modulate(Color(1,1,1,1))
