tool
extends Button

export(String,FILE) var next_scene = ""

func _on_button_up():
	get_tree().change_scene(next_scene)


func _get_configuration_warning():
	"next_scene not set" if next_scene == "" else ""