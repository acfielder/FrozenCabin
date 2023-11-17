extends CharacterBody2D


const SPEED = 300.0


var gravity = 100
var savedYVelocity = velocity.y

func _physics_process(delta):


	velocity.y += gravity * delta

	#velocity.x = move_toward(velocity.x, 0, SPEED)

	var collision = move_and_collide(velocity * delta)

	if collision:
		await get_tree().create_timer(randi_range(0.0067, 0.067)).timeout
		self.position = Vector2(randi_range(32, 240),-30)
		velocity.y = savedYVelocity
		if collision.get_collider().name == "CatchingDude":
			global.sleepScore +=1
	
	move_and_collide(velocity * delta)


func set_gravity(newGrav):
	gravity = newGrav
