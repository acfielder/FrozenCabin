extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	#$DoorOverallTimer.text = $root/Node2D/OverallTimer.text # Replace with function body.
	pass

func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_door"):
		get_node("/root/Node2D/DoorScenetest").show()
		get_node("/root/Node2D/MainDude").collision_check_door = false

func _process(delta):
	$DoorOverallTimer.text = get_node("/root/Node2D").timer_text

func _on_door_close_pressed():
		get_node("/root/Node2D/DoorScenetest").hide()
