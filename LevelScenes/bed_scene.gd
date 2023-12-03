extends Control

var stlevel
var speed = 100


func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_bed"):
		get_tree().change_scene_to_file("res://LevelScenes/bed_scene.tscn")
		get_node("/root/Node2D/MainDude").collision_check_bed = false


func _ready():
	pass


func _process(delta):
	$Score.text = str(global.sleepScore)
	
	
func _physics_process(delta):
	pass 


func _on_bed_close_pressed():
	get_tree().change_scene_to_file("res://test_level.tscn")





