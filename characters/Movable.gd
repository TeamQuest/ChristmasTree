extends KinematicBody2D

const MOVE_SPEED = 300

signal health_changed
#signal dead
signal shoot

export (PackedScene) var Bullet
export (int) var speed
#export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var max_health

var velocity = Vector2()
var can_shoot = true
var alive = true
var health

 
func _ready():
	health = max_health
	emit_signal("health_changed", health * 100/max_health, 0)
	$GunTimer.wait_time = gun_cooldown

func control(_delta):
	pass

func shoot():
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1, 0).rotated($Arm.global_rotation)
		emit_signal('shoot', Bullet, $Arm/Hand.global_position, dir)

func _physics_process(delta):
	if not alive:
		return
	control(delta)
	velocity = move_and_slide(velocity * speed * delta)

func take_damage(amount):
	health -= amount
	if alive:
		$OnBodyAnimation.play("spit_blood")
	emit_signal('health_changed', health * 100 / max_health, amount)
	if health <= 0:
		die()

func _on_GunTimer_timeout():
	can_shoot = true

func die():
	queue_free()

func _when_near_poof_xd(anim_name):
	if anim_name == 'spit_blood' and health <= 0:
		$Poof.visible = true
		$OnBodyAnimation.play("poof_out", -1, 2.0)
