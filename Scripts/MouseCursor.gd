extends Sprite

var energy_small = preload("res://Resources/Images/Lyrium_Blast_Small.png")
var energy_medium = preload("res://Resources/Images/Lyrium_Blast_Medium.png")
var energy_large = preload("res://Resources/Images/Lyrium_Blast_Large.png")
var images = [energy_small, energy_medium, energy_large]

func _ready():
	set_process(true)
	texture = energy_small
	
	
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	#position = mouse_pos - Vector2(width / 2, height / 2)
	#global_position = mouse_pos - Vector2(width / 2, height / 2) + Vector2(64, 64)


func _on_udpate_cursor(selected_attack):
	texture = images[selected_attack]
