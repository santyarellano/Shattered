extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var destination = 2
export var lvl_item = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	match lvl_item:
		2:
			$AnimatedSprite.play("body") 
		3:
			$AnimatedSprite.play("arm")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	

func _on_Area2D_body_entered(body):
	print("cuerpo")
	if(body.name == "Player"):
		print("Player")
		match destination:
			2:
				get_tree().change_scene("res://Niveles/lvl2.tscn")
			3:
				get_tree().change_scene("res://Niveles/lvl3.tscn")
