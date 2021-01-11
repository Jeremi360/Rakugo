extends Node2D


func _process(delta: float) -> void:
	position = lerp(position, get_global_mouse_position(), delta * 100)
