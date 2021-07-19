extends Control

onready var label = get_node("Label")


	
onready var tree_scene = get_tree()
onready var pause_menu = get_node("PauseMenu")



export var pause = false setget set_pause

func _ready():
	
	Playerdata.connect("score_updated",self,"score_updated")


	
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		pause = not pause
		tree_scene.set_input_as_handled()


	

func set_pause(value: bool):
	pause = value
	tree_scene.paused = value
	pause_menu.visible = value
