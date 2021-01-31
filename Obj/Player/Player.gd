extends KinematicBody2D


# Declare member variables here. Examples:
export var walk_spd = 100
export var jump_power = -450
export var gravity = 1200
export var body_state = 1
var right = 0
var left = 0
var walk_vel = 0
var velocity = Vector2()
var jumping = false
var vida=6
var idle_sprt
var walk_sprt
var jump_sprt

# Called when the node enters the scene tree for the first time.
func _ready():
	match body_state:
		1:
			idle_sprt = "hand_idle"
			walk_sprt = "hand_wlk"
			jump_sprt = "hand_jump"
		2:
			idle_sprt = "body_idle"
			walk_sprt = "body_wlk"
			jump_sprt = "body_jump"
		3:
			idle_sprt = "upper_idle"
			walk_sprt = "upper_wlk"
			jump_sprt = "upper_jump"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/HBoxContainer.update_health(vida)
	if !jumping:
		if velocity.x != 0:
			$AnimatedSprite.play(walk_sprt)
			if velocity.x < 0:
				$AnimatedSprite.flip_h = true
			elif velocity.x > 0:
				$AnimatedSprite.flip_h = false
		elif velocity.x == 0:
			$AnimatedSprite.play(idle_sprt)
			$AnimatedSprite.stop()
	else:
		$AnimatedSprite.play(jump_sprt)
		if velocity.x < 0:
			$AnimatedSprite.flip_h = true
		elif velocity.x > 0:
			$AnimatedSprite.flip_h = false
			
	#checar caida
	if(position.y >= 750):
		resetPlayer()
	
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
	
func resetPlayer():
	hide()
	position = get_parent().get_node("PlayerSpawn").position
	$RespawnTimer.start()
	vida = 6
	
func dano():
	set_modulate(Color(1,0.3,0.3,0.3))
	$Timer.start()
	bounceMail()
	print("quitar vida")
	vida-=1
	if(vida <= 0):
		resetPlayer()
	#$CanvasLayer/HBoxContainer.update_health(vida)

#Esta función es para que rebote si colisiona
func bounceMail():
	velocity.y = jump_power * .7
	velocity = move_and_slide(velocity, Vector2(0, -1))
	

#Esta funcion es para cambiarle el color por unos segundos si colisiona con una carta(Mail)
func _on_Timer_timeout():
	set_modulate(Color(1,1,1,1))


func _on_RespawnTimer_timeout():
	show()
