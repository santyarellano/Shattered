extends KinematicBody2D


# Declare member variables here. Examples:
export var walk_spd = 100
export var jump_power = 1
export var gravity = 30
var walk_vel = 0
var right = 0
var left = 0
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	#position.x = 400
	#position.y = 300
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
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
		
	velocity.x = walk_spd*(right - left)
	
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	#if jumping and is_on_floor():
	#	jumping = false
	velocity = move_and_slide(velocity)
