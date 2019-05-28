extends "res://Scripts/Shroom.gd"

var poison = preload("res://Scenes/Poison_Splatter.tscn")
var can_shoot = true

func tick():
	var pos = $"/root/Assurance/Billy".position
	
	if pos < position + Vector2(64, 64) and pos > position - Vector2(64, 64) and can_shoot:
		var scene = poison.instance()
		scene.position = position
		
		#scene.seek_point = pos
		
		$"/root/Assurance/".add_child(scene)
		can_shoot = false
		
		$"/root/Assurance/Sound Library/Small_Water_Spill".play()

func _on_Timer_timeout():
	can_shoot = true