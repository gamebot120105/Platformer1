extends Control


onready var label = get_node("Title2")

func _ready():
	label.text = label.text %[Playerdata.score, Playerdata.deaths]
