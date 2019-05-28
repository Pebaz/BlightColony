extends Area2D

func _ready():
	set_process(true)

func _process(delta):
	if self.get_overlapping_bodies().size() > 0:
		for body in self.get_overlapping_bodies():
			if body.has_node("Health"):
				var health = body.get_node("Health")
				health.got_shot()
				
