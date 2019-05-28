tool
extends Node2D

export (Color) var color

func _ready():
	set_process(true)

func _draw():
	if (Engine.is_editor_hint()):
		draw_line(get_transform().get_origin(), get_viewport().get_mouse_position(), color)
		
	else:
		draw_line(Vector2(0, 0), get_viewport().get_mouse_position(), color)

func _process(delta):
	update()
