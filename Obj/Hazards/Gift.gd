extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(2)


func _on_Gift_body_shape_entered(body_id, body, body_shape, local_shape):
	print(body.get_name())
	
