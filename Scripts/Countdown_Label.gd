extends Label

onready var tween = get_node('Tween')

func _ready():
	tween.interpolate_property(self, "rect_scale", Vector2(1.5, 1.5),
		Vector2(1, 1), 0.5, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	
	tween.start()
	
	_on_LEVEL_TIMER_timeout()

func _on_LEVEL_TIMER_timeout():
	var seconds_left = colonist.count_down
	self.text = str(seconds_left)
	tween.reset_all()
