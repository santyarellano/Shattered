extends Control



func _on_Jugar_pressed():
	get_tree().change_scene("res://Niveles/lvl1.tscn")
	


func _on_Salir_pressed():
	get_tree().change_scene("res://Niveles/NodoQ.tscn")
