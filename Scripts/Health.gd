extends Node

export (int) var hit_points
var current_hp = null
var die = preload("res://Scenes/Die.tscn")

signal got_shot(base, current)

func _ready():
	current_hp = hit_points

func got_shot():
	current_hp -= 1
	
	emit_signal("got_shot", hit_points, current_hp)
	
	if current_hp <= 0:
		get_parent().queue_free()
		var dead = die.instance()
		dead.position = get_parent().position
		get_parent().get_parent().add_child(dead)
