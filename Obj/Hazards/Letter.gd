extends RigidBody2D

export var speed = 200

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(2)





func _on_VisibilityNotifier2D_screen_exited():
	queue_free()





func _on_Letter_body_shape_entered(body_id, body, body_shape, local_shape):
	queue_free()
