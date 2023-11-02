extends Control


func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_bed"):
		get_node("/root/Node2D/BedScene").show()
		get_node("/root/Node2D/MainDude").collision_check_bed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$BedOverallTimer.text = get_node("/root/Node2D").timer_text
	pass


func _on_bed_close_pressed():
	get_node("/root/Node2D/BedScene").hide()
