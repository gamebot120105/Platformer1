extends "res://src/Actors/Actor.gd"

export var score = 200

func _ready():
	set_physics_process(false)
	_velocity.x = -speed.x
	
func _on_Stomp_detector_body_entered(body):
	if body.global_position.y > get_node("Stomp_detector").global_position.y:
		queue_free()
		Playerdata.score += score
		return
	get_node("CollisionShape2D").disabled = true
	queue_free()
	Playerdata.score += score
	
func _physics_process(delta):
	_velocity.y = gravity * delta
	if is_on_wall():
		_velocity.x *= -1
	_velocity.y = move_and_slide(_velocity, Vector2.UP).y



