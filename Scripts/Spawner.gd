tool
extends Position2D

export (bool) var enabled = true
export (float) var spawn_interval = 3
export var spawn_unit = preload("res://Scenes/Shrooms/Big_Shroom.tscn")

func _ready():
	get_node("MyTimer").wait_time = spawn_interval

func _on_Timer_timeout():
	if enabled and get_parent().is_enabled():
		var new_unit = spawn_unit.instance()
		new_unit.set_position(get_position())
		$"/root/Assurance".add_child(new_unit)

# For better editor visibility, draw a circle that will denote position
func _draw():
	if (Engine.is_editor_hint()):
		draw_circle(Vector2(0, 0), 64, Color(1, 0, 0.33, 0.5))
