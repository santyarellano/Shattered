extends Camera2D

onready var topLeft = $Limits/TopLeft
onready var bottomRigth = $Limits/BottomRight

# Called when the node enters the scene tree for the first time.
func _ready():
	limit_top = topLeft.position.y
	limit_left = topLeft.position.x
	limit_bottom = bottomRigth.position.y
	limit_right = bottomRigth.position.x
	
func _param(xend):
	limit_right = xend


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
