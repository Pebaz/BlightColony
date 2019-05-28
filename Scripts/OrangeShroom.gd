extends "res://Scripts/Shroom.gd"

func tick():
	for i in range(get_slide_count()):
		var body = get_slide_collision(i).get_collider()
		if body.is_in_group("Player"):
			var health = body.get_node("Health")
			
			# Add a minute onto the player's timer
			colonist.count_down += 60
			
			for i in range(10):
				health.got_shot()
			get_node("Health").got_shot()
			