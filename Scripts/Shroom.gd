extends KinematicBody2D

export (int) var speed = 100

func _ready():
	set_process(true)
	
func tick():
	pass
	
func _process(delta):
	var desired = (get_position() - $"/root/Assurance/Billy".get_position()).normalized() * speed
	move_and_slide(desired * -1)
	tick()
