extends CharacterBody2D


const SPEED = 135.0


func _physics_process(delta):
	var xdirection = Input.get_axis("left", "right")
	if xdirection:
		velocity.x = xdirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
#	var collision = move_and_collide(velocity * delta)
#	if collision && collision.get_collider().name == "Zcharacter":
#		get_node("/root/BedScene/Zcharacter").position = Vector2(randi_range(32, 240),30)
#	if collision && collision.get_collider().name == "Zfinal2":
#		print("yes")

	
	move_and_collide(velocity * delta)
#	for index in get_slide_collision_count():
#		var collision = get_slide_collision(index)
#		print(collision.get_collider().name)
	
	#if position.x > 30 && position.x < 250:
#	if Input.is_action_pressed("right"):
#		position.x += 1
#	elif Input.is_action_pressed("left"):
#		position.x -= 1
#	if position.x < 30:
#		position.x += 10
#	if position.x > 250:
#		position.x -= 10
	

#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
