extends "res://Scripts/Level.gd"

onready var starting_count = colonist.count_down

var event1 = false

func init():
	pass

func handle_difficulty():
	if colonist.count_down < starting_count - 10:
		
		# Increase spawnage of Big Blue Shrooms
		if not event1:
			event1 = true
			var bbs = $"Spawners/All Big Shroom Spawners/Spawner Big Shroom/MyTimer"
			bbs.wait_time = 3
			
