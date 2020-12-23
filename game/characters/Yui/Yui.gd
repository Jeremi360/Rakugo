extends Node2D

var prev_scale = 1.0 # we make sure that this is float

func _ready():
  prev_scale = scale

func _show(tag, args):
	var tag_split = tag.split(" ", false)
	var emotion = tag_split[1]
	
	if "scale" in args:
		scale.x = args.scale
		scale.y = args.scale
		prev_scale = scale
	
	else:
		scale = prev_scale
	
	for ch in get_children():
		ch.hide()
	
	for ch in get_children():
		if ch.name == emotion:
			ch.show()
	
