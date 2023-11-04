extends Control

var test_num = 0
var stlevel

# Called when the node enters the scene tree for the first time.
func _ready():
	$Score.text = str(0)

func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_door"):
		#get_tree().change_scene_to_file("res://LevelScenes/door_scenetest.tscn")
		stlevel = load("res://LevelScenes/door_scenetest.tscn").instantiate()
		get_tree().get_root().add_child(stlevel)
		get_node("/root/Node2D/MainDude").collision_check_door = false
	
	if event.is_action_pressed("test"):
		test_num = test_num +1

func _process(delta):
	$DoorOverallTimer.text = str(get_node("/root/Node2D/DoorTimer").time_left)
	$Score.text = str(test_num)
	#$Label.text = str(get_node("/root/Node2D/DoorTimer").time_left)
	$Label.text = str(global.doorToAdd)

func _on_door_close_pressed():
		#get_tree().change_scene_to_file("res://test_level.tscn")
		global.doorToAdd = test_num
		queue_free()
		
