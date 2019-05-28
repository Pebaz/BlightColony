extends "res://Scripts/Shroom.gd"

var poison = preload("res://Scenes/Energy_Small.tscn")
var can_shoot = true
var rds = 400

func tick():
	var pos = $"/root/Assurance/Billy".position
	
	if pos < position + Vector2(rds, rds) and pos > position - Vector2(rds, rds) and can_shoot:
		var scene = poison.instance()
		
		# Set the collision mask manually
		scene.set_collision_mask_bit(3, true)
		
		scene.position = position + ((pos - position) * Vector2(0.25, 0.25))
		scene.speed = 400
		scene.seek_point = pos
		$"/root/Assurance/".add_child(scene)
		can_shoot = false
		
		$"/root/Assurance/Sound Library/Small_Shot".play()
	

func _on_Timer_timeout():
	can_shoot = true
