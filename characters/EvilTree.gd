extends "res://characters/Movable.gd"

var target = null
var detect_radius: int

export (int) var arm_speed
 
func _ready():
	$DeadBody.visible = false
	detect_radius = $DetectRadius/CollisionShape2D.shape.radius
 
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
	if alive:
		z_index = -2
		$DeadBody.frame = randi() % 4
		target = null
		$DeadBody.visible = true
		$Body.visible = false
		$BodyCollider.set_deferred("disabled", true)
		alive = false
