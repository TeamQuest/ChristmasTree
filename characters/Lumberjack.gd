extends "res://characters/Movable.gd"

func control(_delta):
	$Arm.look_at(get_global_mouse_position())
	var sideways = false

	var move_vec = Vector2()
	if Input.is_action_pressed("move_left"):
		$AnimationPlayer.play("walk_left")
		move_vec.x -= 1
		sideways = true
	if Input.is_action_pressed("move_right"):
		$AnimationPlayer.play("walk_right")
		move_vec.x += 1
		sideways = true

	if Input.is_action_pressed("move_up"):
		if not sideways:
			$AnimationPlayer.play("walk_up")
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		if not sideways:
			$AnimationPlayer.play("walk_down")
		move_vec.y += 1

	if move_vec.x == 0 and move_vec.y == 0:
		$AnimationPlayer.play("idle")

	move_vec = move_vec.normalized()
	velocity = move_vec * 100
	
	if Input.is_action_just_pressed("click"):
		shoot()

func die():
	#game over
	queue_free()
