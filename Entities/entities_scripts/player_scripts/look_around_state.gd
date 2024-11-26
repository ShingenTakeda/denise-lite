class_name LookAroundState extends PlayerMovementState

func enter() -> void:
	print_debug("Entering look around state")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	PLAYER.current_mouse_speed = PLAYER.LOW_MOUSE_SPEED
	PLAYER.current_speed = 0.0

func handle_input(event: InputEvent) -> void:
	if PLAYER.is_on_floor() and event.is_action_pressed("liberate_mouse"):
		transition.emit("IdleState")