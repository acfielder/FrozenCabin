extends Control

var stlevel
var score = 0

func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_bed"):
#		stlevel = load("res://LevelScenes/bed_scene.tscn").instantiate()
#		get_tree().get_root().add_child(stlevel)
		global.OverallTimerVal = get_node("/root/Node2D/OverallTimer").get_time_left()
		global.DoorTimerVal = get_node("/root/Node2D/DoorTimer").get_time_left()
		global.EatTimerVal = get_node("/root/Node2D/EatTimer").get_time_left()
		global.BedTimerVal = get_node("/root/Node2D/BedTimer").get_time_left()
		global.ClimbTimerVal = get_node("/root/Node2D/ClimbTimer").get_time_left()
		get_tree().change_scene_to_file("res://LevelScenes/bed_scene.tscn")
		get_node("/root/Node2D/MainDude").collision_check_bed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$MainTimer.wait_time = global.OverallTimerVal
	$MainTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$BedOverallTimer.text = get_node("/root/Node2D").timer_text
	#$BedOverallTimer.text = str(get_node("/root/Node2D/BedTimer").time_left)
	$Label.text = str(floor($MainTimer.time_left))
	


func _on_bed_close_pressed():
	#global.sleepScore = ascore
	global.OverallTimerVal = $MainTimer.time_left
	get_tree().change_scene_to_file("res://test_level.tscn")





