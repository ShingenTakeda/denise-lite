class_name WalkingState extends PlayerMovementState

func enter() -> void:
	PLAYER.current_speed = PLAYER.WALKING_SPEED

func update(delta: float) -> void:
	if PLAYER.velocity.length() == 0:
		transition.emit("IdleState")

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("sprint") and PLAYER.is_on_floor():
		transition.emit("SprintState")