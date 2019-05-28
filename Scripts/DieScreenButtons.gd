extends ColorRect

export (bool) var is_main_menu_button = false
export (Color) var my_color
export (Color) var my_other_color
var mouse_over = false

func _ready():
	set_process(true)
	
func _process(delta):
	if Input.is_action_pressed("shoot") and mouse_over:
		if not is_main_menu_button:
			$"/root/Dead Scene/Sound Library/GUI_Sound2".play()
			
			# --------------------------------------------------------------------------
			# Play the next level based on which scene it is
			# This is used from the Story Screen.
			
			colonist.load_next_level()
			
			# --------------------------------------------------------------------------
			
		else:
			$"/root/Dead Scene/Sound Library/GUI_Sound2".play()
			load('res://Scenes/Main Menu.tscn')
			get_tree().change_scene('res://Scenes/Main Menu.tscn')
			colonist.level = -1

func _on_ColorRect_mouse_entered():
	self.color = my_other_color
	mouse_over = true
	$"/root/Dead Scene/Sound Library/GUI_Sound1".play()

func _on_ColorRect_mouse_exited():
	self.color = my_color
	mouse_over = false
