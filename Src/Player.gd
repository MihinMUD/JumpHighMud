extends Actor 


func _physics_process(delta: float) -> void:
	var direction =  Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		-1.0 if Input.is_action_pressed("jump") and is_on_floor() else 1.0
	)
	velocity = calculate_move_velocity(velocity , direction , speed)
	velocity = move_and_slide(velocity , Vector2.UP )
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Walk")

	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Walk")

	elif Input.is_action_pressed("ui_accept") and is_on_floor():
		$AnimatedSprite.play("Jump")
	else:
		$AnimatedSprite.play("Idle")
func calculate_move_velocity(linear_velocity: Vector2 , direction:Vector2 , speed: Vector2) -> Vector2:
	var new_velocity = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	return new_velocity
