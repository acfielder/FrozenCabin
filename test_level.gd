extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$OverallTimer.wait_time = global.OverallTimerVal
	#$DoorTimer.wait_time = global.DoorTimerVal
	#$EatTimer.wait_time = global.EatTimerVal
	#$BedTimer.wait_time = global.BedTimerVal
	#$ClimbTimer.wait_time = global.ClimbTimerVal
	#$FurnaceTimer.wait_time = global.FurnaceTimerVal
	
	
	$OverallTimer.start()
	#$DoorTimer.start()
	#$EatTimer.start()
	#$BedTimer.start()
	#$ClimbTimer.start()
	#$FurnaceTimer.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$TimeLeftLabel.text= str($Timer.time_left)
	$TimeLeftLabel.text = "%d:%02d" % [floor($OverallTimer.time_left / 60), int($OverallTimer.time_left) % 60]
	
	
	$DoorLevelMain.text = str(floor(global.DoorTimerVal.time_left))
	#$Label.text = str(global.doorToAdd)
	$DoorProgress.value = floor(global.DoorTimerVal.time_left)
	if global.doorToAdd > 0:
		global.DoorTimerVal.set_wait_time(global.DoorTimerVal.time_left + (global.doorToAdd * 4))
		if global.DoorTimerVal.wait_time > 100:
			global.DoorTimerVal.set_wait_time(100)
		global.DoorTimerVal.start()
		await get_tree().create_timer(0.00167).timeout
		global.doorToAdd = 0
		
	
#	$HungerLevelMain.text = str(floor($EatTimer.time_left))
#	$EatProgress.value = floor($EatTimer.time_left)
#	if global.eaten > 0:
#		$EatTimer.set_wait_time($EatTimer.time_left +(global.eaten * 4))
#		if $EatTimer.wait_time > 100:
#			$EatTimer.set_wait_time(100)
#		$EatTimer.start()
#		await get_tree().create_timer(0.00167).timeout
#		global.eaten = 0
		
	$HungerLevelMain.text = str(floor(global.EatTimerVal.time_left))
	$EatProgress.value = floor(global.EatTimerVal.time_left)
	if global.eaten > 0:
		global.EatTimerVal.set_wait_time(global.EatTimerVal.time_left +(global.eaten * 4))
		if global.EatTimerVal.wait_time > 100:
			global.EatTimerVal.set_wait_time(100)
		global.EatTimerVal.start()
		await get_tree().create_timer(0.00167).timeout
		global.eaten = 0
		
		
		
		
	$BedLevelMain.text = str(floor(global.BedTimerVal.time_left))
	$SleepProgress.value = floor(global.BedTimerVal.time_left)
	if global.sleepScore > 0:
		global.BedTimerVal.set_wait_time(global.BedTimerVal.time_left +(global.sleepScore * 4))
		if global.BedTimerVal.wait_time > 100:
			global.BedTimerVal.set_wait_time(100)
		global.BedTimerVal.start()
		await get_tree().create_timer(0.00167).timeout
		global.sleepScore = 0
		
	$FurnaceLevelMain.text = str(floor(global.FurnaceTimerVal.time_left))
	$FurnaceProgress.value = floor(global.FurnaceTimerVal.time_left)
	if global.furnaceScore > 0:
		global.FurnaceTimerVal.set_wait_time(global.FurnaceTimerVal.time_left +(global.furnaceScore * 4))
		if global.FurnaceTimerVal.wait_time > 100:
			global.FurnaceTimerVal.set_wait_time(100)
		global.FurnaceTimerVal.start()
		await get_tree().create_timer(0.00167).timeout
		global.furnaceScore = 0
	
	$ClimbLevelMain.text = str(floor(global.ClimbTimerVal.time_left))
	$ClimbProgress.value = floor(global.ClimbTimerVal.time_left)
	

	if global.ClimbTimerVal.time_left < 80:
		$Snow.visible = true
	else:
		$Snow.visible = false
	if global.ClimbTimerVal.time_left < 60:
		$Snow2.visible = true
	else:
		$Snow2.visible = false
	if global.ClimbTimerVal.time_left < 40:
		$Snow3.visible = true
	else:
		$Snow3.visible = false
		
	
		#change to be signals for on timer timeout
#	if $ClimbTimer.time_left <=0:
#		global.causeOfDeath = "the roof caving in"
#		get_tree().change_scene_to_file("res://LevelScenes/GameOver.tscn")
#	elif $EatTimer.time_left <= 0:
#		global.causeOfDeath = "starvation"
#		get_tree().change_scene_to_file("res://LevelScenes/GameOver.tscn")
#	elif $BedTimer.time_left <= 0:
#		global.causeOfDeath = "sleep deprivation"
#		get_tree().change_scene_to_file("res://LevelScenes/GameOver.tscn")
#	elif $FurnaceTimer.time_left <= 0:
#		global.causeOfDeath = "froze to death"
#		get_tree().change_scene_to_file("res://LevelScenes/GameOver.tscn")

	

func _on_timer_timeout():
	print("whelp ya died")



