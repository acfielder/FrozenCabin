extends CharacterBody2D
const SPEED = 125.0
const speed = 10
@export var collision_check_bed = false;
@export var collision_check_eat = false;
@export var collision_check_climb = false;
@export var collision_check_door = false;


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
		
#func _process(delta):
#	if Input.is_action_pressed("right"):
#		position.x += 1
#	if Input.is_action_pressed("left"):
#		position.x -= 1
#	if Input.is_action_pressed("up"):
#		position.y -= 1
#	if Input.is_action_pressed("down"):
#		position.y += 1
	

	
#	var velocity = Vector2.ZERO
#	if Input.is_action_pressed("right"):
#		velocity.x += 1
#	if Input.is_action_pressed("left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("down"):
#		velocity.y += 1
#	if Input.is_action_pressed("up"):
#		velocity.y -= 1
	
	
#	if velocity.length() > 0:
#		velocity = velocity.normalized() * speed
#		$MainDude.play()
#	else:
#		$MainDude.stop()
	
#this is the orignal func
	var collision = move_and_collide(velocity * delta)
	
	if collision && collision_check_bed == false && collision.get_collider().name == "Bed":
		collision_check_bed = true;
		collision_check_eat = false;
		collision_check_climb = false;
		collision_check_door = false;

	if collision && collision_check_eat == false && collision.get_collider().name == "Table":
		collision_check_eat = true;
		collision_check_bed = false;
		collision_check_climb = false;
		collision_check_door = false;

	if collision && collision_check_climb == false && collision.get_collider().name == "Ladder":
		collision_check_climb = true;
		collision_check_bed = false;
		collision_check_eat = false;
		collision_check_door = false;

	if collision && collision_check_door == false && collision.get_collider().name == "Door":
		collision_check_climb = false;
		collision_check_bed = false;
		collision_check_eat = false;
		collision_check_door = true;

	move_and_collide(velocity * delta)
	

#func get_input():
#	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	velocity = input_dir * speed
#
#func _physics_process(delta):
#	get_input()
#	move_and_collide(velocity * delta)
