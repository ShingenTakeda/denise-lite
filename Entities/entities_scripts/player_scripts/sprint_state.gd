class_name SprintState extends PlayerMovementState

func enter() -> void:
	PLAYER.current_speed = Globals.player.SPRINTING_SPEED

func update(delta: float) -> void:
	pass

func handle_input(event: InputEvent) -> void:
	if event.is_action_released("sprint"):
		transition.emit("WalkingState")