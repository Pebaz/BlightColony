extends Label

onready var tween = get_node("Tween")

func _ready():
	self.text = colonist.tips[colonist.level]
	
	tween.interpolate_property(self, "modulate", Color(0, 0.2, 1, 0),
		Color(0, 0.2, 0.8, 1), 3, Tween.TRANS_QUAD, Tween.EASE_OUT)

func _on_Tween_tween_completed(object, key):
	tween.start()
