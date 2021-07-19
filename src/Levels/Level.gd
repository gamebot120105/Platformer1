extends Node2D

export var pause: PackedScene

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().quit
