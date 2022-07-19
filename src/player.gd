extends KinematicBody2D

var player_max_speed = 100
var player_acceleration = 500
var friction = 500
var player_speed = 0

var velocity = Vector2.ZERO

func _physics_process(delta):
	var player_vector = Vector2.ZERO
	player_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	player_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	player_vector = player_vector.normalized()
	
	if(player_vector != Vector2.ZERO):
		if(player_speed < player_max_speed):
			player_speed += player_acceleration * delta
		velocity = player_vector * player_speed * delta
	else:
		velocity = Vector2.ZERO
		player_speed = 0
	
	move_and_collide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
