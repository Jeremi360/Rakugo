extends Node2D

var current_cursor_int := 0
var current_cursor : Node2D

func _ready() -> void:
	current_cursor = $"arrow-cursor"
	var hotspot = $"arrow-cursor/Position2D".position
	set_hotspot(hotspot)

func set_hotspot(hotspot:Vector2):
	ProjectSettings.set("display/mouse_cursor/custom_image_hotspot", hotspot)

func _process(delta: float) -> void:
	position = lerp(position, get_global_mouse_position(), delta * 100)

func _input(event):
	# if over item
	if event.is_action_pressed("rakugo_rollforward"):
		change_cursor(1)
	
	elif event.is_action_pressed("rakugo_rollback"):
		change_cursor(-1)

func change_cursor(i:= 1):
	current_cursor.hide()
	current_cursor_int += i

	if current_cursor_int > get_child_count() -1:
		current_cursor_int = 0
	
	if current_cursor_int < 0:
		current_cursor_int = get_child_count() -1 

	current_cursor = get_child(current_cursor_int)
	set_hotspot(current_cursor.get_node("Position2D").position)
	current_cursor.show()

	
