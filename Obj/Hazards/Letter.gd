extends RigidBody2D

export var speed = 200







func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
