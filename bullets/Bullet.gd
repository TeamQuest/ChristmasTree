extends Area2D

export (int) var speed
export (int) var damage
export (float) var lifetime

var velocity = Vector2()

func start(_position, _direction):
	position = _position
	rotation = _direction.angle()
	if -PI < 2 * rotation and 2 * rotation < PI:
		# Flip animation
		scale.x *= -1
		
	$AnimationPlayer.play("throw")
	$Lifetime.wait_time = lifetime
	velocity = _direction * speed
	$Lifetime.start()

func _process(delta):
	position += velocity * delta

func _on_Bullet_body_entered(body):
	$AnimationPlayer.stop()
	queue_free()
	if body.has_method('take_damage'):
		body.take_damage(damage)

func _on_Lifetime_timeout():
	queue_free()
	$AnimationPlayer.stop()
