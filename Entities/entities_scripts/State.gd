class_name State

extends Node

signal transition(new_state: StringName)

func enter() -> void:
	pass

func exit() -> void:
	pass

func handle_input(event: InputEvent):
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

