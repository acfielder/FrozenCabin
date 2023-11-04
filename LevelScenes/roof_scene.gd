extends Control

var stlevel

func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_climb"):
		#get_node("/root/Node2D/RoofScene").show()
		stlevel = load("res://LevelScenes/roof_scene.tscn").instantiate()
		get_tree().get_root().add_child(stlevel)
		get_node("/root/Node2D/MainDude").collision_check_climb = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$RoofOverallTimer.text = get_node("/root/Node2D").timer_text
	$RoofOverallTimer.text = str(get_node("/root/Node2D/ClimbTimer").time_left)

func _on_roof_close_pressed():
	#global.something = ascore
	queue_free()
