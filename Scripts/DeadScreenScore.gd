extends Label

func _ready():
	self.text = "Score: " + str(colonist.score)