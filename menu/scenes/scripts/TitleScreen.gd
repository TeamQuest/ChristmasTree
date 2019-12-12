extends Control


func _ready():
	pass # Replace with function body.


func _on_NewGame_pressed():
	get_tree().change_scene("res://maps/Level1.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Button_pressed():
	get_tree().change_scene("res://menu/scenes/SetName.tscn")
