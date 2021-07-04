extends "res://Player/Actor.gd"

export var EnemyKillValue = 50

func _ready():
	set_physics_process(false)
	_velocity.x = -speed.x
	
func _on_HurtArea_body_entered(body):
	if body.global_position.y > get_node("HurtArea").global_position.y:
		return
	get_node("CollisionShape2D").set_deferred("disabled", true)
	PlayerData.score += EnemyKillValue
	queue_free()
	
func _physics_process(delta):

	if is_on_wall():
		_velocity.x *= -1.0 
	
	_velocity.y += Gravity * delta
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
