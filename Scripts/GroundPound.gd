extends Area2D

func _ready():
	set_process(true)
	$Tween.interpolate_property($Smoke, "modulate",
			Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2,
			Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.interpolate_property(self, "scale", Vector2(4, 4), Vector2(20, 20), 1,
			Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()

func _process(delta):
	if self.get_overlapping_bodies().size() > 0:
		for body in self.get_overlapping_bodies():
			if body.has_node("Health"):
				var health = body.get_node("Health")
				health.got_shot()
	
	if scale >= Vector2(20, 20):
		queue_free()
