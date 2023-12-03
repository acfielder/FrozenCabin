extends Node

const home = "res://test_level.tscn"

var doorTotal = randi_range(400, 500)
var doorCurrent
var eaten = 0
var sleepScore = 0
var roofScore = 0
var furnaceScore = 0


var OverallTimerVal := Timer.new()
var ClimbTimerVal := Timer.new()
var FurnaceTimerVal := Timer.new()
var EatTimerVal := Timer.new()
var DoorTimerVal := Timer.new()
var BedTimerVal := Timer.new()


var causeOfDeath = "n"
var winReason = ""


func _ready():
	doorCurrent = doorTotal
	
	add_child(OverallTimerVal)
	OverallTimerVal.set_wait_time(240)
	OverallTimerVal.one_shot = true
	OverallTimerVal.start()
	
	add_child(EatTimerVal)
	EatTimerVal.set_wait_time(200)
	EatTimerVal.one_shot = true
	EatTimerVal.start()
	
	add_child(DoorTimerVal)
	DoorTimerVal.set_wait_time(randi_range(450, 550))
	DoorTimerVal.one_shot = true
	DoorTimerVal.start()
	
	add_child(BedTimerVal)
	BedTimerVal.set_wait_time(200)
	BedTimerVal.one_shot = true
	BedTimerVal.start()
	
	add_child(ClimbTimerVal)
	ClimbTimerVal.set_wait_time(1000)
	ClimbTimerVal.one_shot = true
	ClimbTimerVal.start()
	
	add_child(FurnaceTimerVal)
	FurnaceTimerVal.set_wait_time(150)
	FurnaceTimerVal.one_shot = true
	FurnaceTimerVal.start()





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
		global.causeOfDeath = "freezing to death"
		get_tree().change_scene_to_file("res://LevelScenes/GameOver.tscn")
	elif OverallTimerVal.time_left == 0:
		get_tree().change_scene_to_file("res://LevelScenes/YouWin.tscn")
		winReason = "someone dug you out"
	elif doorCurrent <= 0:
		get_tree().change_scene_to_file("res://LevelScenes/YouWin.tscn")
		winReason = "you dug yourself out"
