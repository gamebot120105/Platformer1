extends Actor

const floor_normal = Vector2.UP
export var stomp_impulse = 1000.0

func _on_Stomped_area_entered(area):
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)
	_velocity.y = move_and_slide(_velocity,floor_normal).y

func _on_Stomped_body_entered(body):
	die()

func _physics_process(delta):
	var jump_strength = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction =  get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, jump_strength) 
	_velocity = move_and_slide(_velocity,floor_normal)

func get_direction():
	return Vector2(
		Input.get_action_strength("move_right")-Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0 
	)
	
func calculate_move_velocity(linear_velocity, direction, speed, jump_strength):
	var new_velocity = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	if jump_strength:
		new_velocity.y = 0.0
	return new_velocity

func calculate_stomp_velocity(_velocity, stomp_impulse):
	var new_velocity = _velocity
	new_velocity.y = -stomp_impulse
	return new_velocity	
	
func die():
	Playerdata.deaths += 1
	queue_free()
	get_tree().reload_current_scene()




