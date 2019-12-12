extends CanvasLayer


func update_healthbar(value):
	$Margin/Container/HealthBar.value = value


func _ready():
	$Margin/Container/CharacterName.text = get_node("/root/globals").player_name
	