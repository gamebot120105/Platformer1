extends Node

signal score_updated
signal player_died

export var score = 0 setget set_score
export var deaths = 0 setget set_deaths

func reset():
	score = 0
	deaths = 0

func set_score(value):
	score = value
	emit_signal("score_updated")
	
func set_deaths(value):
	deaths = value
	emit_signal("player_died")
