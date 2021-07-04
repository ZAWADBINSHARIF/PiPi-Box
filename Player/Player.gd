extends Actor

export var push_up = 1000.0

func _physics_process(_delta):
	var is_jump_interrupted = Input.is_action_just_released("Jump") and _velocity.y < 0.0 
	var direction = get_direction()
	_velocity = calculate_move__velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

func get_direction():
	return Vector2(
	Input.get_action_strength("Move Right") 
	- Input.get_action_strength("Move Left"), 
	-1.0 if Input.get_action_strength("Jump") 
	and is_on_floor()
	else 0.0
	)

func calculate_move__velocity(
	liner__velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
	) -> Vector2:
	
	var out = liner__velocity
	out.x = speed.x * direction.x
	out.y += Gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	return out


func _on_PlayerHurtArea_area_entered(_area):
	_velocity = kill_and_jump(_velocity, push_up)

func kill_and_jump(liner__velocity: Vector2, push: float):
	var out = liner__velocity
	out.y = -push
	
	return out


func _on_PlayerHurtArea_body_entered(_body):
	var one = 1
	PlayerData.dead += one
	queue_free()
