extends HBoxContainer

enum MODES {partial}

var heart_full = preload("res://Obj/HUD/Pruebas/vida lleno.png")
var heart_empty = preload("res://Obj/HUD/Pruebas/vida vacío.png")
var heart_half = preload("res://Obj/HUD/Pruebas/vida medio.png")

export (MODES) var mode = MODES.partial

func update_health(value):
	match mode:

		MODES.partial:
			update_partial(value)

func update_partial(value):
	for i in get_child_count():
		if value > i * 2 + 1:
			get_child(i).texture = heart_full
		elif value > i * 2:
			get_child(i).texture = heart_half
		else:
			get_child(i).texture = heart_empty
