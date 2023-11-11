extends CharacterBody2D




func _process(delta):
	#if position.x > 30 && position.x < 250:
	if Input.is_action_pressed("right"):
		position.x += 1
	elif Input.is_action_pressed("left"):
		position.x -= 1
	if position.x < 30:
		position.x += 10
	if position.x > 250:
		position.x -= 10
	

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
