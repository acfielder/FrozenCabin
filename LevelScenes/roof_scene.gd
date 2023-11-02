extends Control

func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_climb"):
		get_node("/root/Node2D/RoofScene").show()
		get_node("/root/Node2D/MainDude").collision_check_climb = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$RoofOverallTimer.text = get_node("/root/Node2D").timer_text
	pass

func _on_roof_close_pressed():
	get_node("/root/Node2D/RoofScene").hide()
