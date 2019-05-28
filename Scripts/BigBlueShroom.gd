extends "res://Scripts/Shroom.gd"

signal ground_pound()

func tick():
	var player_pos = $"/root/Assurance/Billy".position
	if player_pos < position + Vector2(256, 256) and player_pos > position - Vector2(256, 256):
		emit_signal("ground_pound")
