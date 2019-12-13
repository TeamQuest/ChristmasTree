extends "res://bullets/Bullet.gd"

signal critical_shot

const crit_chance = 0.20

func start(_position, _direction):
	if randf() < crit_chance:
		$Sprite.frame = randi() % 2
		emit_signal("critical_shot")
	else:
		$Sprite.frame = randi() % 4 + 2
	position = _position
	rotation = _direction.angle()
	if -PI < 2 * rotation and 2 * rotation < PI:
		# Flip animation
		scale.x *= -1
	$Lifetime.wait_time = lifetime
	velocity = _direction * speed * 1.5
	$Lifetime.start()

func _process(_delta):
	rotation += 0.2


func _on_Bauble_critical_shot():
	damage *= 3
