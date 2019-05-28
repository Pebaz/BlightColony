extends ColorRect

export (bool) var is_quit_button = false
export (Color) var my_color
export (Color) var my_other_color
var mouse_over = false

func _ready():
	set_process(true)
	
func _process(delta):
	if Input.is_action_pressed("shoot") and mouse_over:
		if not is_quit_button:
			
			if name in "HOWTO":
				colonist.level = 10
				load("res://Scenes/Screens/How To Play Screen.tscn")
				get_tree().change_scene("res://Scenes/Screens/How To Play Screen.tscn")
				return
				
			
			$"/root/Main Menu/Sound Library/GUI_Sound2".play()

			# --------------------------------------------------------------------------
			# Play the next level based on which scene it is
			# This is used from the Story Screen.
			
			colonist.load_next_level()
			
			# --------------------------------------------------------------------------
			
		else:
			$"/root/Main Menu/Sound Library/GUI_Sound2".play()
			get_tree().quit()

func _on_ColorRect_mouse_entered():
	self.color = my_other_color
	mouse_over = true
	$"/root/Main Menu/Sound Library/GUI_Sound1".play()

func _on_ColorRect_mouse_exited():
	self.color = my_color
	mouse_over = false
