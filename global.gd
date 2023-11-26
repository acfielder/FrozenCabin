extends Node

const home = "res://test_level.tscn"

var doorToAdd = 0
var eaten = 0
var sleepScore = 0
var roofScore = 0
var furnaceScore = 0



#need variables for each progress bar level
	#these are really just the timer variables

var OverallTimerVal = 100
#var DoorTimerVal = 100
#var EatTimerVal = 100
#var BedTimerVal = 100
var ClimbTimerVal := Timer.new()
var FurnaceTimerVal := Timer.new()

var EatTimerVal := Timer.new()
var DoorTimerVal := Timer.new()
var BedTimerVal := Timer.new()




var causeOfDeath = "n"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(EatTimerVal)
	EatTimerVal.set_wait_time(100)
	EatTimerVal.one_shot = true
	EatTimerVal.start()
	
	add_child(DoorTimerVal)
	DoorTimerVal.set_wait_time(100)
	DoorTimerVal.one_shot = true
	DoorTimerVal.start()
	
	add_child(BedTimerVal)
	BedTimerVal.set_wait_time(100)
	BedTimerVal.one_shot = true
	BedTimerVal.start()
	
	add_child(ClimbTimerVal)
	ClimbTimerVal.set_wait_time(100)
	ClimbTimerVal.one_shot = true
	ClimbTimerVal.start()
	
	add_child(FurnaceTimerVal)
	FurnaceTimerVal.set_wait_time(100)
	FurnaceTimerVal.one_shot = true
	FurnaceTimerVal.start()






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ClimbTimerVal.time_left == 0:
		causeOfDeath = "the roof caving in"
		get_tree().change_scene_to_file("res://LevelScenes/GameOver.tscn")
	elif EatTimerVal.time_left <= 0:
		global.causeOfDeath = "starvation"
		get_tree().change_scene_to_file("res://LevelScenes/GameOver.tscn")
	elif BedTimerVal.time_left <= 0:
		global.causeOfDeath = "sleep deprivation"
		get_tree().change_scene_to_file("res://LevelScenes/GameOver.tscn")
	elif FurnaceTimerVal.time_left <= 0:
		global.causeOfDeath = "froze to death"
		get_tree().change_scene_to_file("res://LevelScenes/GameOver.tscn")

	
