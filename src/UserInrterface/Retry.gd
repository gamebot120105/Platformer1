extends Button



func _on_button_up():
	Playerdata.score = 0
	get_tree().reload_current_scene()
