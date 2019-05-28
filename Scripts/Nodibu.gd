extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# Pixels per second
export var move_speed = 160
var first_image = true
var idle = true

var root = 0
var walk_up = [2, 3]
var walk_down = [4, 5]
var walk_right = [14, 15]
var walk_left = [6, 7]

func _ready():
	"""
	This lets Godot know to process this node's logic each frame.
	"""
	set_process(true)
	set_physics_process(true)
	
	
func _physics_process(delta):
	var motion = Vector2()
	idle = false

	
	if (Input.is_key_pressed(KEY_A)):
		if position.x > -970:
			motion += Vector2(-1 * delta, 0)
		
	if (Input.is_key_pressed(KEY_D)):
		if position.x < 1990:
			motion += Vector2(1 * delta, 0)
		
	if (Input.is_key_pressed(KEY_W)):
		if position.y > -980:
			motion += Vector2(0, -1 * delta)
				
	if (Input.is_key_pressed(KEY_S)):
		if position.y < 1950:
			motion += Vector2(0, 1 * delta)
				
	if (motion == Vector2(0, 0)):
		idle = true
		
	motion = motion.normalized() * move_speed
	move_and_slide(motion)


func _process(delta):
	if (Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
		
	if (idle):
		$Nodibu.frame = root
		
	if (Input.is_key_pressed(KEY_W)):
		if first_image:
			$Nodibu.frame = walk_up[0]
		else:
			$Nodibu.frame = walk_up[1]
			
	if (Input.is_key_pressed(KEY_S)):
		if first_image:
			$Nodibu.frame = walk_down[0]
		else:
			$Nodibu.frame = walk_down[1]
		
	if (Input.is_key_pressed(KEY_D)):
		if first_image:
			$Nodibu.frame = walk_right[0]
		else:
			$Nodibu.frame = walk_right[1]
		
	if (Input.is_key_pressed(KEY_A)):
		if first_image:
			$Nodibu.frame = walk_left[0]
		else:
			$Nodibu.frame = walk_left[1]


func _on_Timer_timeout():
	# Change the texture based what frame it is
	first_image = not first_image
