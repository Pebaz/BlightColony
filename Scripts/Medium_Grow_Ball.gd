extends Sprite

func _ready():
	set_process(true)
	
	
func _process(delta):
	get_parent().scale += Vector2(0.04, 0.04)