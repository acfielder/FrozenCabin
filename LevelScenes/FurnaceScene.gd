extends Control


var count = 100

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("SceneOpen") && get_node("/root/Node2D/MainDude").get("collision_check_furnace"):
		get_tree().change_scene_to_file("res://LevelScenes/FurnaceScene.tscn")
		get_node("/root/Node2D/MainDude").collision_check_furnace = false


	if event.is_action_pressed("test") && count <60 && count >40:
		global.furnaceScore += 1
		$Axe.rotation = -1
		await get_tree().create_timer(0.134).timeout
		$Axe.rotation = 0


func _process(delta):
	$Label.text = str(global.furnaceScore)
	
	if global.furnaceScore >= 1:
		$Cut1.visible = true
	else:
		$Cut1.visible = false
	if global.furnaceScore >= 2:
		$Cut2.visible = true
	else:
		$Cut2.visible = false
	if global.furnaceScore >= 3:
		$Cut3.visible = true
	else:
		$Cut3.visible = false
	if global.furnaceScore >= 4:
		$Cut4.visible = true
	else:
		$Cut4.visible = false
		
	count-=1
	if count <= 0:
		count = 100
	$CuttingTime.value = count




func _on_button_pressed():
	get_tree().change_scene_to_file("res://test_level.tscn")
