extends Node

func _ready():
	$"Sound Library/Piffle Poffle".play()
	
	init()

func _process(delta):
	if not $"Sound Library/Piffle Poffle".playing:
		$"Sound Library/Piffle Poffle".play()

func _on_LEVEL_TIMER_timeout():
	colonist.count_down -= 1
	
	if colonist.count_down == 0:
		colonist.load_next_level()
		
	handle_difficulty()
		
func init():
	pass		

func handle_difficulty():
	pass
