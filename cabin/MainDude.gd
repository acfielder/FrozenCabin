extends CharacterBody2D

const SPEED = 125.0

signal start_minigame(minigame_node)

func _physics_process(delta):
	var xdirection = Input.get_axis("left", "right")
	if xdirection:
		velocity.x = xdirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var ydirection = Input.get_axis("up", "down")
	if ydirection:
		velocity.y = ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	

	var collision:KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("minigame_trigger"):
			start_minigame.emit(collision.get_collider().my_minigame_path)
