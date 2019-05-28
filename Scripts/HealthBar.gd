extends ColorRect

var base_width = 40 # Needs to match initial width of rect

func _update_health(base, current):
	rect_size.x = base_width * (current / float(base))
	