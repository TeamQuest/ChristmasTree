extends YSort

func set_camera_limits(_map_limits, _map_cellsize):
	$Lumberjack/Camera2D.limit_left = _map_limits.position.x * _map_cellsize.x
	$Lumberjack/Camera2D.limit_right = _map_limits.end.x * _map_cellsize.x
	$Lumberjack/Camera2D.limit_top = _map_limits.position.y * _map_cellsize.y
	$Lumberjack/Camera2D.limit_bottom = _map_limits.end.y * _map_cellsize.y

func _on_Movable_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)