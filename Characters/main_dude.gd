extends CharacterBody2D
const SPEED = 125.0
const speed = 10
@export var collision_check_bed = false;
@export var collision_check_eat = false;
@export var collision_check_climb = false;
@export var collision_check_door = false;
@export var collision_check_furnace = false;


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
	if collision:
		print(collision.get_collider().name)
	
	if collision && collision_check_bed == false && collision.get_collider().name == "Bed":
		collision_check_bed = true;
		collision_check_eat = false;
		collision_check_climb = false;
		collision_check_door = false;
		collision_check_furnace = false;

	if collision && collision_check_eat == false && collision.get_collider().name == "Table":
		collision_check_eat = true;
		collision_check_bed = false;
		collision_check_climb = false;
		collision_check_door = false;
		collision_check_furnace = false;

	if collision && collision_check_climb == false && collision.get_collider().name == "Ladder":
		collision_check_climb = true;
		collision_check_bed = false;
		collision_check_eat = false;
		collision_check_door = false;
		collision_check_furnace = false;

	if collision && collision_check_door == false && collision.get_collider().name == "Door":
		collision_check_climb = false;
		collision_check_bed = false;
		collision_check_eat = false;
		collision_check_door = true;
		collision_check_furnace = false;
		
	if collision && collision_check_furnace == false && collision.get_collider().name == "Furnace":
		collision_check_furnace = true;
		collision_check_climb = false;
		collision_check_bed = false;
		collision_check_eat = false;
		collision_check_door = false;
		
	
	move_and_collide(velocity * delta)
	

#New work
#extends CharacterBody2D
#
# const SPEED = 125.0
#
# signal start_minigame(minigame_node)
#
# func _physics_process(delta):
# 	var xdirection = Input.get_axis("left", "right")
# 	if xdirection:
# 		velocity.x = xdirection * SPEED
# 	else:
# 		velocity.x = move_toward(velocity.x, 0, SPEED)
# 	var ydirection = Input.get_axis("up", "down")
# 	if ydirection:
# 		velocity.y = ydirection * SPEED
# 	else:
# 		velocity.y = move_toward(velocity.y, 0, SPEED)
#
#
# 	var collision:KinematicCollision2D = move_and_collide(velocity * delta)
# 	if collision:
# 		var collider = collision.get_collider()
# 		if collider.is_in_group("minigame_trigger"):
# 			start_minigame.emit(collision.get_collider().my_minigame_path)
