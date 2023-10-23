extends CharacterBody2D

const SPEED = 125.0
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

	move_and_slide()

