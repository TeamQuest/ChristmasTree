extends Control


func _ready():
	$Audio.autoplay = true;
	$Audio.playing = true;
	pass # Replace with function body.


func _on_NewGame_pressed():
	get_tree().change_scene("res://menu/scenes/SetName.tscn")


func _on_Exit_pressed():
	get_tree().quit()

