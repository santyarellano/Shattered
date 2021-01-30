extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const FLOOR=Vector2(0,-1)
var ACC=10
var direction=1
var velocity= Vector2()



func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if(direction==-1):
		#elevacion
		ACC=1
	else:
		#caida
		ACC=6	
	velocity.y += (ACC*direction)
	velocity= move_and_slide(velocity,FLOOR)

func _on_IntervaloCaida_timeout():
	velocity.y=0;
	direction=direction*-1
