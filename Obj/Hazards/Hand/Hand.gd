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
		ACC=0.1
	else:
		#caida
		ACC=0.3	
	velocity.y += (ACC*direction)
	var collision = move_and_collide(velocity)
	if collision:
		if (collision.collider.name=="Player"):
			_on_IntervaloCaida_timeout()
			print("Vida reducida")
	#velocity= move_and_slide(velocity,FLOOR)
	#for i in get_slide_count():
	#	var collision = get_slide_collision(i)
	#	if(collision.collider.name=="Player"):
	#		print("game ova")
func _on_IntervaloCaida_timeout():
	velocity.y=0;
	direction=direction*-1
