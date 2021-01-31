extends RigidBody2D

export var fall_speed = 20

func _ready():
	get_tree().set_debug_collisions_hint(true)
	set_contact_monitor(true)
	set_max_contacts_reported(3)
	linear_velocity = Vector2(0, fall_speed)

#func _process(delta):
#	position.y += fall_speed * delta

func _on_IntervaloCaida_timeout():
	fall_speed *= -1
	linear_velocity = Vector2(0, fall_speed)


func _on_Hand_body_entered(body):
	print("hola")
	if(body.get_name() == "Player"):
		body.resetPlayer()
