extends RigidBody2D

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(1)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Letter_body_entered(body):
	
	if(body.get_name() == "Player"):
		body.dano()
		
	queue_free()
