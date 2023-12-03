extends Control


var stlevel

func _ready():
	$Score.text = str(0)
	$SnowBar.set_max(global.doorTotal)
	

func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_door"):
		get_tree().change_scene_to_file("res://LevelScenes/door_scenetest.tscn")
		get_node("/root/Node2D/MainDude").collision_check_door = false
	
	if event.is_action_pressed("test"):
		global.doorCurrent -= 1

func _process(delta):
	$Score.text = str(global.doorCurrent)
	
	$SnowBar.value = global.doorCurrent

func _on_door_close_pressed():
		#global.doorToAdd = score
		get_tree().change_scene_to_file("res://test_level.tscn")
		

