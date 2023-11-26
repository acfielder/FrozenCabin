extends Control


var count = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$MainTimer.wait_time = global.OverallTimerVal
	$MainTimer.start()
	
func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_furnace"):
		global.OverallTimerVal = get_node("/root/Node2D/OverallTimer").get_time_left()
		#global.DoorTimerVal = get_node("/root/Node2D/DoorTimer").get_time_left()
		#global.EatTimerVal = get_node("/root/Node2D/EatTimer").get_time_left()
		#global.BedTimerVal = get_node("/root/Node2D/BedTimer").get_time_left()
		#global.ClimbTimerVal = get_node("/root/Node2D/ClimbTimer").get_time_left()
		#global.FurnaceTimerVal = get_node("/root/Node2D/FurnaceTimer").get_time_left()
		get_tree().change_scene_to_file("res://LevelScenes/FurnaceScene.tscn")
		get_node("/root/Node2D/MainDude").collision_check_furnace = false


	if event.is_action_pressed("test") && count <60 && count >40:
		global.furnaceScore += 1
		$Axe.rotation = -1
		await get_tree().create_timer(0.134).timeout
		$Axe.rotation = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str(global.furnaceScore)
	
	if global.furnaceScore >= 1:
		$Cut1.visible = true
	else:
		$Cut1.visible = false
	if global.furnaceScore >= 2:
		$Cut2.visible = true
	else:
		$Cut2.visible = false
	if global.furnaceScore >= 3:
		$Cut3.visible = true
	else:
		$Cut3.visible = false
	if global.furnaceScore >= 4:
		$Cut4.visible = true
	else:
		$Cut4.visible = false
		
	count-=1
	if count <= 0:
		count = 100
	#$CuttingTime.value = floor($Timer.time_left)
	$CuttingTime.value = count




func _on_button_pressed():
	global.OverallTimerVal = $MainTimer.time_left
	get_tree().change_scene_to_file("res://test_level.tscn")
