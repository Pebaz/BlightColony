extends "res://Scripts/Health.gd"

func got_shot():
	current_hp -= 1
	
	emit_signal("got_shot", hit_points, current_hp)
	
	if current_hp <= 0:
		load("res://Scenes/Dead Scene.tscn")
		get_tree().change_scene("res://Scenes/Dead Scene.tscn")