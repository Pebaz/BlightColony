extends Sprite

onready var tween = get_node("Tween")

export (Vector2) var target_scale

func _ready():
	# Method 1
	tween.interpolate_property(self, "scale", scale,
			target_scale, 1, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	
	# Method 2
	#tween.interpolate_method(self, "lerp_func1", scale, scale + Vector2(20, 20),
	#		1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	
	tween.start()
	$"/root/Assurance/Sound Library/Blop".play()

#func lerp_func1(value):
#	scale += value


func _on_Timer_timeout():
	queue_free()
	
