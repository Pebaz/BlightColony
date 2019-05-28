extends Camera2D

signal update_cursor(selected_attack)

var energy_small = preload("res://Scenes/Energy_Small.tscn")
var energy_medium = preload("res://Scenes/Energy_Medium.tscn")
var energy_large = preload("res://Scenes/Energy_Large.tscn")
export (int) var selected_attack = 0
var scenes = [energy_small, energy_medium, energy_large]

var can_fire_small = false
var can_fire_medium = false
var can_fire_large = false

var flame_thrower_on = false


func _ready():
	set_process(true)


func _process(delta):
	# Make the arrow point at the cursor
	$"/root/Assurance/Billy/Arrow".points[1] = get_local_mouse_position() / 2
	
	if Input.is_action_just_pressed("switch_attack"):
		selected_attack += 1
		if selected_attack >= scenes.size():
			selected_attack = 0
		emit_signal("update_cursor", selected_attack)
		
	if Input.is_action_pressed("shoot"):
		var player_pos = $"/root/Assurance/Billy".position
		
		if selected_attack == 0 and can_fire_small:
			$"/root/Assurance/Sound Library/Small_Whoosh".play()
			shoot_small(player_pos)
			
		if selected_attack == 1 and can_fire_medium:
			flame_thrower_on = true
			shoot_medium(player_pos)
			
		if selected_attack == 2 and can_fire_large:
			$"/root/Assurance/Sound Library/Fireball".play()
			shoot_large(player_pos)
	
	
	var sfx = $"/root/Assurance/Sound Library/FlameStream"		
	if Input.is_action_pressed("shoot") and flame_thrower_on:
		if not sfx.is_playing():
			sfx.play()
	else:
		flame_thrower_on = false
		sfx.stop()
		

func spawn_bullet(bullet):
	$"/root/Assurance".add_child(bullet)


func shoot_small(player_pos):
	var bullet = scenes[selected_attack].instance()
	bullet.set_global_position(player_pos)
	bullet.seek_point = get_global_mouse_position()
	spawn_bullet(bullet)
	can_fire_small = false

	
func shoot_medium(player_pos):
	"""
	Fires a trident of fireballs!
	"""
	var bullet = scenes[selected_attack].instance()
	bullet.set_global_position(player_pos)
	bullet.seek_point = get_global_mouse_position()
	spawn_bullet(bullet)
	can_fire_medium = false
	
	
func shoot_large(player_pos):
	var mouse_pos = get_global_mouse_position() * Vector2(100, 100)
	var vectors = []
	var step = 360 / float(16)
	var angle = 0
	for i in range(16):
		vectors.append(mouse_pos.rotated(angle))
		angle += step

	for target_vector in vectors:
		var bullet = scenes[selected_attack].instance()
		bullet.set_global_position(player_pos)
		bullet.seek_point = target_vector
		spawn_bullet(bullet)

	can_fire_large = false
	
		
func _on_timer_small():
	can_fire_small = true


func _on_timer_medium():
	can_fire_medium = true


func _on_timer_large():
	can_fire_large = true






