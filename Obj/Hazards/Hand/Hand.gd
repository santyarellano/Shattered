extends RigidBody2D

export var fall_speed_default = 1
onready var _x_pos = position.x
var velocity = Vector2()
var fall_speed = 0

func _ready():
	get_tree().set_debug_collisions_hint(true)
	set_contact_monitor(true)
	set_max_contacts_reported(3)
	fall_speed = fall_speed_default
	linear_velocity = Vector2(0, fall_speed)
	position.x = _x_pos
	
func _process(delta):
	move_local_y(fall_speed, false)

func _on_IntervaloCaida_timeout():
	if (fall_speed == 0):
		fall_speed = fall_speed_default
	fall_speed *= -1

func _on_Hand_body_entered(body):
	if(body.get_name() == "Player"):
		body.resetPlayer()
	if (body.get_name() == "TileMap"):
		fall_speed = 0
