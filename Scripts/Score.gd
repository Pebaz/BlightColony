extends Label

func _on_Timer_timeout():
	colonist.score += 1
	self.text = str(colonist.score)
