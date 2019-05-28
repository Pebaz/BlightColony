extends Node

export (bool) var enabled = true

func is_enabled():
	return enabled and get_parent().enabled