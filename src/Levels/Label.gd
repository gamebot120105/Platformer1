extends Label


onready var label = get_node()

func _ready():
	label.text = label.text %[Playerdata.score, Playerdata.deaths]
