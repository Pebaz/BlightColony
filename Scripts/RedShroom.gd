extends "res://Scripts/Shroom.gd"

var poison = preload("res://Scenes/Poison.tscn")
var can_shoot = true

func tick():
	var pos = $"/root/Assurance/Billy".position
	
	if pos < position + Vector2(256, 256) and pos > position - Vector2(256, 256) and can_shoot:
		var scene = poison.instance()
		scene.position = position
		scene.seek_point = pos
		$"/root/Assurance/".add_child(scene)
		can_shoot = false
		
		$"/root/Assurance/Sound Library/Small_Water_Splish".play()
	

func _on_Timer_timeout():
	can_shoot = true
