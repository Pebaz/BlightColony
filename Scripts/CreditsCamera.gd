extends Camera2D

export (int) var speed = 0.5

func _ready():
	set_process(true)

func _process(delta):
	self.translate(Vector2(0, speed))
