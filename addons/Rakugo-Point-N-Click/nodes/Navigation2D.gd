extends Navigation2D

export(float) var character_speed = 400.0
export(float) var lerp_speed = 50
export(NodePath) var character_node

onready var _character = get_node(character_node) 

var path = []

# The 'click' event is a custom input action defined in
# Project > Project Settings > Input Map tab
func _input(event):
	if not event.is_action_pressed('ui_left_click'):
		return
	_update_navigation_path(_character.position, get_local_mouse_position())


func _update_navigation_path(start_position, end_position):
	# get_simple_path is part of the Navigation2D class
	# it returns a PoolVector2Array of points that lead you from the
	# start_position to the end_position
	path = get_simple_path(start_position, end_position, true)
	# The first point is always the start_position
	# We don't need it in this example as it corresponds to the character's position
	path.remove(0)
	set_process(true)


func _process(delta):
	var walk_distance = character_speed * delta
	move_along_path(walk_distance)


func move_along_path(distance):
	var last_point = _character.position
	var delta = get_process_delta_time()
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		
		# the position to move to falls between two points
		if distance <= distance_between_points:
			var next_pos = last_point.linear_interpolate(path[0], distance / distance_between_points)
			_character.position = lerp(_character.position, next_pos, delta * lerp_speed)
			return
		
		# the position is past the end of the segment
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	# the character reached the end of the path
	_character.position = lerp(_character.position, last_point, delta * lerp_speed)
	set_process(false)
