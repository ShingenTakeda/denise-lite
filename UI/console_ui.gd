extends Control

@onready var console_output = $VBoxContainer/stdout
@onready var console_input = $VBoxContainer/REPL

signal correct_expr
var lua_vm = LuaAPI.new()

var message = "Set a to true(a = true)"
var repl_string = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lua_vm.bind_libraries(["base", "table", "string"])
	console_output.add_text("Kill john lennon")
	lua_vm.push_variant("a", "false")

	var temp_script = "
		function get_a()
			return a
		end
	"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
