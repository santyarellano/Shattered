extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Jugar_pressed():
	get_tree().change_scene("res://Niveles/Playground.tscn")
	


func _on_Salir_pressed():
	get_tree().change_scene("res://Niveles/NodoQ.tscn")