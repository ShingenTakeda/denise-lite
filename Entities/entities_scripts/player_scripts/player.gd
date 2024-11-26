class_name Player extends CharacterBody3D

@onready var camera = $cam

@export var WALKING_SPEED : float = 5.0
@export var CROUCHED_SPEED : float = 1.75
@export var SPRINTING_SPEED : float = 6.25
@export var JUMP_VELOCITY : float = 4.5
@export var HIGH_MOUSE_SPEED : float = 10
@export var LOW_MOUSE_SPEED :float = 2
var current_mouse_speed = HIGH_MOUSE_SPEED
var current_speed = WALKING_SPEED
var mouse = Vector2()

var currentHP := 10
@export var maxHP := 10
@export var damage := 1

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	add_to_group("Player")
	Globals.player = self
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#TODO: Put this in states
	# Handle releasing the cursor
	# if Input.is_action_just_pressed("liberate_mouse"):
	# 	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
	# 		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	# 		current_mouse_speed = LOW_MOUSE_SPEED
	# 		#current_speed = 0.0
	# 	else:
	# 		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	# 		current_mouse_speed = HIGH_MOUSE_SPEED
	# 		#current_speed = WALKING_SPEED
			
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "foward", "backward")
	#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var velz = (input_dir.y * transform.basis.z * current_speed)
	var velx = input_dir.x * transform.basis.x * current_speed

	rotation_degrees.y -= mouse.x * current_mouse_speed *delta
	camera.rotation_degrees.x -= mouse.y * current_mouse_speed * delta
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -80, 80)
	velocity = velx + velz + Vector3(0, -gravity, 0)

	move_and_slide()
	mouse = Vector2()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse = event.relative

func toggle_crouch() -> void:
	pass
	
func take_damage(enemy_damage): #if deve chamar a tela de game over, não reload current scene
	currentHP -= enemy_damage
	if currentHP <= 0:
		get_tree().reload_current_scene()
		
