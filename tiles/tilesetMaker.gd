extends Node

var tile_size = Vector2(32, 32)

onready var texture = $Sprite.texture

func _ready():
	var t_width = texture.get_width() / tile_size.x
	var t_height = texture.get_height() / tile_size.y
	var ts = TileSet.new()
	var id = 0
	for x in range(t_width):
		for y in range(t_height):
			var region = Rect2(x * tile_size.x, y * tile_size.y, tile_size.x, tile_size.y)
			ts.create_tile(id)
			ts.tile_set_texture(id, texture)
			ts.tile_set_region(id, region)
			id += 1
	ResourceSaver.save("res://tiles/terrain_tiles1.tres", ts)
			
	
