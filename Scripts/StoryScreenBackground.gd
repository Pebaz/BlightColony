extends ColorRect

var my_colors = [
	Color(0.25, 0.50, 0.25), null,
	Color(0.88, 0.73, 0.44), null,
	Color(0.37, 0.37, 0.37), null,
	Color(0.65, 0, 0), null,
	Color(1, 1, 1), null,
	Color(0.5, 0.5, 0.5)
]

func _ready():
	self.color = my_colors[colonist.level]
