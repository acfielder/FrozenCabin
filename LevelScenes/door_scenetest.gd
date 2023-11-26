extends Control

var test_num = 0
var stlevel

# Called when the node enters the scene tree for the first time.
func _ready():
	$Score.text = str(0)
	$MainTimer.wait_time = global.OverallTimerVal
	$MainTimer.start()
	

func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_door"):
		#get_tree().change_scene_to_file("res://LevelScenes/door_scenetest.tscn")
		global.OverallTimerVal = get_node("/root/Node2D/OverallTimer").get_time_left()
		#global.DoorTimerVal = get_node("/root/Node2D/DoorTimer").get_time_left()
		#global.EatTimerVal = get_node("/root/Node2D/EatTimer").get_time_left()
		#global.BedTimerVal = get_node("/root/Node2D/BedTimer").get_time_left()
		#global.ClimbTimerVal = get_node("/root/Node2D/ClimbTimer").get_time_left()
		#global.FurnaceTimerVal = get_node("/root/Node2D/FurnaceTimer").get_time_left()

		#stlevel = load("res://LevelScenes/door_scenetest.tscn").instantiate()
		#get_tree().get_root().add_child(stlevel)
		get_tree().change_scene_to_file("res://LevelScenes/door_scenetest.tscn")
		get_node("/root/Node2D/MainDude").collision_check_door = false
	
	if event.is_action_pressed("test"):
		test_num = test_num +1

func _process(delta):
	#$DoorOverallTimer.text = str(get_node("/root/Node2D/DoorTimer").time_left)
	$Score.text = str(test_num)
	$Label.text = str(floor($MainTimer.time_left))
	#$Label.text = str(get_node("/root/Node2D/DoorTimer").time_left)
	#$Label.text = str(global.doorToAdd)

func _on_door_close_pressed():
		#get_tree().change_scene_to_file("res://test_level.tscn")
		global.doorToAdd = test_num
		global.OverallTimerVal = $MainTimer.time_left
		get_tree().change_scene_to_file("res://test_level.tscn")
		
