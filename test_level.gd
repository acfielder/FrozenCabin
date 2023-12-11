extends Node2D


func _ready():
	$DoorProgress.max_value = global.doorTotal


func _process(delta):
	

	$TimeLeftLabel.text = "%d:%02d" % [floor(global.OverallTimerVal.time_left / 60), int(global.OverallTimerVal.time_left) % 60]
	
	
	$DoorLevelMain.text = str(global.doorCurrent)
	$DoorProgress.value = global.doorCurrent
#	if global.doorToAdd > 0:
#		global.DoorTimerVal.set_wait_time(global.DoorTimerVal.time_left + (global.doorToAdd * 4))
#		if global.DoorTimerVal.wait_time > 100:
#			global.DoorTimerVal.set_wait_time(1000)
#		global.DoorTimerVal.start()
#		await get_tree().create_timer(0.00167).timeout
#		global.doorToAdd = 0
	#will no longer be a timer - still need to display value on progress bar
	#essentially a score that decrements
	#

		
	$HungerLevelMain.text = str(floor(global.EatTimerVal.time_left))
	$EatProgress.value = floor(global.EatTimerVal.time_left)
	if global.eaten > 0:
		global.EatTimerVal.set_wait_time(global.EatTimerVal.time_left +(global.eaten * 6))
		if global.EatTimerVal.wait_time > 250:
			global.EatTimerVal.set_wait_time(250)
		global.EatTimerVal.start()
		await get_tree().create_timer(0.00167).timeout
		global.eaten = 0
		
		
	$BedLevelMain.text = str(floor(global.BedTimerVal.time_left))
	$SleepProgress.value = floor(global.BedTimerVal.time_left)
	if global.sleepScore > 0:
		global.BedTimerVal.set_wait_time(global.BedTimerVal.time_left +(global.sleepScore * 4))
		if global.BedTimerVal.wait_time > 250:
			global.BedTimerVal.set_wait_time(250)
		global.BedTimerVal.start()
		await get_tree().create_timer(0.00167).timeout
		global.sleepScore = 0
		
	$FurnaceLevelMain.text = str(floor(global.FurnaceTimerVal.time_left))
	$FurnaceProgress.value = floor(global.FurnaceTimerVal.time_left)
	if global.furnaceScore > 0:
		global.FurnaceTimerVal.set_wait_time(global.FurnaceTimerVal.time_left +(global.furnaceScore * 4))
		if global.FurnaceTimerVal.wait_time > 200:
			global.FurnaceTimerVal.set_wait_time(200)
		global.FurnaceTimerVal.start()
		await get_tree().create_timer(0.00167).timeout
		global.furnaceScore = 0
	
	$ClimbLevelMain.text = str(floor(global.ClimbTimerVal.time_left))
	$ClimbProgress.value = floor(global.ClimbTimerVal.time_left)
	



