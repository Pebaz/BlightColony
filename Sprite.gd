extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
extends AnimatedSprite

func _ready():
set_process_input(true)
pass

func _input(event):
if (event.type == InputEvent.MOUSE_BUTTON):
print("1")
pass