extends "res://characters/Movable.gd"

var target = null

export (int) var detect_radius
export (int) var arm_speed
 
func _ready():
	var circle = CircleShape2D.new()
	$DetectRadius/CollisionShape2D.shape = circle
	$DetectRadius/CollisionShape2D.shape.radius = detect_radius
 
func control(_delta):
	pass
 
func kill():
	queue_free()
	
func _process(delta):
	if target and alive:
		var vec_to_player = (target.global_position - global_position).normalized()
		velocity = vec_to_player * 100
		
		var current_dir = Vector2(1, 0).rotated($Arm.global_rotation)
		$Arm.global_rotation = current_dir.linear_interpolate(vec_to_player, arm_speed * delta).angle()
		
		if vec_to_player.dot(current_dir) > 0.90:
			shoot()
	else:
		velocity.x = 0
		velocity.y = 0

func _on_DetectRadius_body_entered(body):
	if body.name == "Lumberjack":
		target = body

func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null

func die():
	target = null
	alive = false
	$Body.texture = load("res://images/arm.png")
