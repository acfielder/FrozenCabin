extends Control

var stlevel
var speed = 100
#var positiony: float
#var toAdd: float

#@onready var Z1 = preload("res://Characters/Z1s.tscn")
#@onready var Z2 = preload("res://Characters/Z1s.tscn")


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
	
#	var z1 = Z1.instantiate()
#	add_child(z1)
#	z1.position = Vector2(randi_range(32, 240),10)
#
#	await get_tree().create_timer(0.8).timeout
#
#	var z2 = Z2.instantiate()
#	add_child(z2)
#	z2.position = Vector2(randi_range(32, 240),10)


#	$Zfinal2.set_gravity2(0)
	#$Zcharacter.position = Vector2(randi_range(32, 240),30)
#	await get_tree().create_timer(0.4).timeout
#	$Zfinal2.set_gravity2(100)
#	$Zfinal2.position = Vector2(randi_range(32, 240),-5)
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$BedOverallTimer.text = get_node("/root/Node2D").timer_text
	#$BedOverallTimer.text = str(get_node("/root/Node2D/BedTimer").time_left)
	$Label.text = str(floor($MainTimer.time_left))
#	toAdd = positiony -10
#	$Zfinal1.position.y = toAdd
#	$Zfinal1.position = Vector2(100,-100)
#	if $Zfinal1.position.y > -200:
#		$Zfinal1.position.y = 0
	$Score.text = str(global.sleepScore)
	

	#upon colliding with ground tiles
		#change position to top again at random x
	#upon colliding with bucket
		#score increases and position changes to top random x again

func _physics_process(delta):
	pass #(speed * delta)


func _on_bed_close_pressed():
	#global.sleepScore = ascore
	global.OverallTimerVal = $MainTimer.time_left
	get_tree().change_scene_to_file("res://test_level.tscn")





