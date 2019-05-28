extends KinematicBody2D

var seek_point = null
var seek_desired = null
var explosion = preload("res://Scenes/Explosion.tscn")
export (int) var speed = 300
export (int) var hit_points = 1

func _ready():
	set_process(true)

func _process(delta):
	if seek_point != null:
		if seek_desired == null:
			seek_desired = (seek_point - get_position()).normalized() * speed
	
		#if is_on_wall() or is_on_ceiling() or is_on_floor():
		if get_slide_count() > 0:
			var new_explosion = explosion.instance()
			new_explosion.set_position(get_position())
			new_explosion.scale = scale
			get_parent().add_child(new_explosion)
			hit_points -= 1
			
			# Damage the entity you hit we hit:
			for i in range(get_slide_count()):
				var body = get_slide_collision(i).get_collider()
				
				if body != null and body.has_node("Health"):
					var health = body.get_node("Health")
					if health != null:
						health.got_shot()

		move_and_slide(seek_desired)
	
	if hit_points <= 0:
		#queue_free()
		var timer = Timer.new()
		timer.wait_time = 0.01
		timer.connect("timeout", self, "on_die")
		add_child(timer)
		timer.start()


func on_die():
	queue_free()
	



















