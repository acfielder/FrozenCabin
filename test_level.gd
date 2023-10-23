extends Node2D


func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("MainDude").get("collision_check_bed"):
		get_node("BedScene").show()
		get_node("MainDude").collision_check_bed = false
		
	if event.is_action_pressed("SceneOpen") && get_node("MainDude").get("collision_check_eat"):
		get_node("EatScene").show()
		get_node("MainDude").collision_check_eat = false
		
	if event.is_action_pressed("SceneOpen") && get_node("MainDude").get("collision_check_climb"):
		get_node("RoofScene").show()
		get_node("MainDude").collision_check_climb = false
		





# Called when the node enters the scene tree for the first time.
func _ready():
	$OverallTimer.start()
	
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$TimeLeftLabel.text= str($Timer.time_left)
	$TimeLeftLabel.text = "%d:%02d" % [floor($OverallTimer.time_left / 60), int($OverallTimer.time_left) % 60]




func _on_timer_timeout():
	print("all done")

func _on_bed_close_pressed():
	get_node("BedScene").hide()
	
func _on_eat_close_pressed():
	get_node("EatScene").hide()

func _on_roof_close_pressed():
	get_node("RoofScene").hide()


