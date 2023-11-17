extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$OverallTimer.wait_time = global.OverallTimerVal
	$DoorTimer.wait_time = global.DoorTimerVal
	$EatTimer.wait_time = global.EatTimerVal
	$BedTimer.wait_time = global.BedTimerVal
	$ClimbTimer.wait_time = global.ClimbTimerVal
	
	
	$OverallTimer.start()
	$DoorTimer.start()
	$EatTimer.start()
	$BedTimer.start()
	$ClimbTimer.start()
	#$MainDude.position = Vector2(97, 140)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$TimeLeftLabel.text= str($Timer.time_left)
	$TimeLeftLabel.text = "%d:%02d" % [floor($OverallTimer.time_left / 60), int($OverallTimer.time_left) % 60]
	
	
	$DoorLevelMain.text = str(floor($DoorTimer.time_left))
	#$Label.text = str(global.doorToAdd)
	$DoorProgress.value = floor($DoorTimer.time_left)
	if global.doorToAdd > 0:
		$DoorTimer.set_wait_time($DoorTimer.time_left + (global.doorToAdd * 4))
		$DoorTimer.start()
		await get_tree().create_timer(0.00167).timeout
		global.doorToAdd = 0
		
	
	$HungerLevelMain.text = str(floor($EatTimer.time_left))
	$EatProgress.value = floor($EatTimer.time_left)
	if global.eaten > 0:
		$EatTimer.set_wait_time($EatTimer.time_left +(global.eaten * 4))
		$EatTimer.start()
		await get_tree().create_timer(0.00167).timeout
		global.eaten = 0
		
	$BedLevelMain.text = str(floor($BedTimer.time_left))
	$SleepProgress.value = floor($BedTimer.time_left)
	if global.sleepScore > 0:
		$BedTimer.set_wait_time($BedTimer.time_left +(global.sleepScore * 4))
		$BedTimer.start()
		await get_tree().create_timer(0.00167).timeout
		global.sleepScore = 0
		
	
	$ClimbLevelMain.text = str(floor($ClimbTimer.time_left))
	$ClimbProgress.value = floor($ClimbTimer.time_left)
	
	$BedLevelMain.text = str(floor($BedTimer.time_left))
	$SleepProgress.value = floor($BedTimer.time_left)

	if $ClimbTimer.time_left < 80:
		$Snow.visible = true
	else:
		$Snow.visible = false
	if $ClimbTimer.time_left < 60:
		$Snow2.visible = true
	else:
		$Snow2.visible = false
	if $ClimbTimer.time_left < 40:
		$Snow3.visible = true
	else:
		$Snow3.visible = false

func _on_timer_timeout():
	print("all done")



