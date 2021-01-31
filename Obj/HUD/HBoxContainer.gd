extends HBoxContainer



var heart_full = preload("res://Niveles/UI/vida_lleno.png")
var heart_half = preload("res://Niveles/UI/vida_medio.png")
var heart_empty = preload("res://Niveles/UI/vida_vacío.png")


func _ready():
	get_child(0).texture = heart_empty
	get_child(1).texture = heart_empty
	get_child(2).texture = heart_empty
	pass
	
func update_health(value):
	for i in get_child_count():
		#print(get_child_count())
		if value > i * 2 + 1:
			get_child(i).texture = heart_full
		elif value > i * 2:
			get_child(i).texture = heart_half
		else:
			get_child(i).texture = heart_empty

