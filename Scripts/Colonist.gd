extends Node

var count_down = 120
var score = 0
var level = -1

var tips = [
	"Orange Gorfs hurt very little but add an entire minute onto your timer if they hit you.", "",
	"Green Gorfs generate large pools of poisonous liquid, don't step in them.", "",
	"Red Gorfs will hunt you down and fire poison balls at you.", "",
	"Blue Gorfs will use their very large hands to pound the ground and cause a huge shockwave.", "",
	"Yellow Gorfs will fire blasts of Lyrium energy at you, don't let them corner you."
]

var titles = [
	"Nodibu is running for his life after inadvertently insulting the honor of the mushroom king. He will stop at nothing to see that his infraction has been rectified.", "",
	"After fending off countless Gorfs, Nodibu managed to slip away from the main group and head into the desert, where he accidentally regained the attention of his formidable foes.", "",
	"Gorf after Gorf he slew, until the entrance to an underground cave caught Nodibu's eye. With the aim of having a more defensible position, he entered.", "",
	"As Nodibu's fatigue grew commensurate to the depth of the cave, he came across a lava fountain. Being that deep within the earth was not without its dangers.", "",
	"Emerging through a dormant volcano tube, Nodibu discovered the remains of an ancient arctic civilization.", "",
	"After running for nearly 5 days, Nodibu had finally vanquished the last of his pursuers. Next time, when in the presence of a king, Nodibu decided that he would probably just keep his mouth shut."
]

var levels = [
	'res://Scenes/Screens/Story Screen.tscn', 'res://Scenes/Assurance.tscn',
	'res://Scenes/Screens/Story Screen.tscn', 'res://Scenes/Levels/Desert.tscn',
	'res://Scenes/Screens/Story Screen.tscn', 'res://Scenes/Levels/Cave.tscn',
	'res://Scenes/Screens/Story Screen.tscn', 'res://Scenes/Levels/Lava.tscn',
	'res://Scenes/Screens/Story Screen.tscn', 'res://Scenes/Levels/Arctic.tscn',
	'res://Scenes/Credits.tscn'
]
	
func load_next_level():
	level += 1
	var load_this = levels[level]
	load(load_this)
	get_tree().change_scene(load_this)