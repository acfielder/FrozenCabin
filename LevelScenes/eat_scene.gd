extends Control

var stlevel

func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_eat"):
		get_tree().change_scene_to_file("res://LevelScenes/eat_scene.tscn")
		get_node("/root/Node2D/MainDude").collision_check_eat = false

func _ready():
	pass

func _process(delta):
	pass

func _on_eat_close_pressed():
	global.eaten = $MemoryMap.score
	get_tree().change_scene_to_file("res://test_level.tscn")

