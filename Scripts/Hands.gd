extends Node2D

onready var tween_up = $"Tween UP"
onready var tween_down = $"Tween DOWN"

var ground_pound = preload("res://Scenes/GroundPound.tscn")
var can_pound = true

func _ready():
	tween_up.interpolate_property(self, "position", self.position, self.position - Vector2(0, 48), 1,
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			
	tween_down.interpolate_property(self, "position", self.position - Vector2(0, 48), self.position, 0.5,
			Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)


func _on_Big_Shroom_ground_pound():
	if can_pound:
		tween_up.start()
		tween_up.reset_all()
		can_pound = false
		


func _on_Tween_UP_tween_completed(object, key):
	tween_down.start()
	tween_down.reset_all()

func _on_Tween_DOWN_tween_completed( object, key ):
	can_pound = true
	
	var pound = ground_pound.instance()
	pound.position = global_position
	$"/root/Assurance".add_child(pound)
	$"/root/Assurance/Sound Library/Large_Thump".play()
