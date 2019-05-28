extends Label

onready var tween = get_node("Tween")

func _ready():
	self.text = colonist.titles[colonist.level]
	tween.interpolate_property(self, "rect_scale", Vector2(1.2, 1.2),
		Vector2(1, 1), 1, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	tween.start()
	
	