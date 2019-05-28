extends Spatial

var move_speed = 8

func _ready():
	"""
	Make the Godot Engine update this node every frame and turn the mouse off.
	"""
	set_process(true);
	Input.set_mouse_mode(1)
	
func _process(delta):
	"""
	Moves the camera when the WASD keys are pressed and also rotate the camera
	based on the movement of the mouse.
	"""
	if (Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
		
	if (Input.is_key_pressed(KEY_A)):
		translate(Vector3(-move_speed * delta, 0, 0))
		
	if (Input.is_key_pressed(KEY_D)):
		translate(Vector3(move_speed * delta, 0, 0))
		
	if (Input.is_key_pressed(KEY_W)):
		translate(Vector3(0, 0, -move_speed * delta)) 
				
	if (Input.is_key_pressed(KEY_S)):
		translate(Vector3(0, 0, move_speed * delta)) 
		
	# Get how far the cursor is from the center of the screen
	var speed = ($Camera.get_viewport().get_mouse_pos() / OS.get_window_size() / 0.5)
	
	# Make sure it is a percentage
	speed -= Vector2(1, 1)
	
	# Rotate on the Y axis to turn the camera
	self.global_rotate(Vector3(0, 1, 0), 40 * speed.x * delta)
	
	# Put the mouse back in the center
	get_viewport().warp_mouse(OS.get_window_size() / 2)
	
