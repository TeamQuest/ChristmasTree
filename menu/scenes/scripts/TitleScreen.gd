extends Control


func _ready():
	pass


func _on_NewGame_pressed():
	get_tree().change_scene("res://menu/scenes/SetName.tscn")


func _on_Exit_pressed():
	get_tree().quit()

