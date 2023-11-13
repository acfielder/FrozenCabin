extends Control

var stlevel

func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_bed"):
		stlevel = load("res://LevelScenes/bed_scene.tscn").instantiate()
		get_tree().get_root().add_child(stlevel)
		get_node("/root/Node2D/MainDude").collision_check_bed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$BedOverallTimer.text = get_node("/root/Node2D").timer_text
#	$BedOverallTimer.text = str(get_node("/root/Node2D/BedTimer").time_left)
	pass



func _on_bed_close_pressed():
	#global.sleepScore = ascore
	queue_free()
