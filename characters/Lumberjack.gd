extends "res://characters/Movable.gd"

func control(delta):
	$Arm.look_at(get_global_mouse_position())
	
	var move_vec = Vector2()
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	velocity = move_vec * 100
	
	if Input.is_action_just_pressed("click"):
		shoot()
	
func die():
	#game over
	queue_free()
	get_tree().get_root().get_node("Level/Audio_dead").play()
