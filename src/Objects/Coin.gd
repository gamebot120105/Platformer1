extends Area2D

export var score = 20

onready var anime_player = get_node("AnimationPlayer")



func _on_body_entered(body):
	anime_player.play("Fade")
	Playerdata.score += score
	
