class_name IdleState extends PlayerMovementState

func enter() -> void:
	print_debug("Entering idle state")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	PLAYER.current_mouse_speed = PLAYER.HIGH_MOUSE_SPEED
	PLAYER.current_speed = PLAYER.WALKING_SPEED

func update(delta: float) -> void:
	if PLAYER.velocity.length() > 0 and PLAYER.is_on_floor():
		transition.emit("WalkingState")

func handle_input(event: InputEvent) -> void:
	if PLAYER.is_on_floor() and event.is_action_pressed("liberate_mouse"):
		transition.emit("LookAroundState")
