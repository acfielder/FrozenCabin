extends Control

var stlevel

func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_eat"):
		#get_node("/root/Node2D/EatScene").show()
		stlevel = load("res://LevelScenes/eat_scene.tscn").instantiate()
		get_tree().get_root().add_child(stlevel)
		get_node("/root/Node2D/MainDude").collision_check_eat = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$EatOverallTimer.text = str(get_node("/root/Node2D/EatTimer").time_left)
	

func _on_eat_close_pressed():
	#get_node("/root/Node2D/EatScene").hide()
	global.eaten = $MemoryMap.score
	queue_free()

