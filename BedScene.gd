extends Node2D


var text_to_show = "im doing my best"
var show_time = 1


#func _ready():
#	$ColorRect/Label.text = text_to_show
#	$Timer.start(show_time)

func _on_Timer_timeout():
	queue_free()
	


func _on_button_pressed():
	get_node("BedScene").hide()


#func _input(event):
#	if event.is_action_pressed("BedOpen"):
#		get_node("BedScene").show()

