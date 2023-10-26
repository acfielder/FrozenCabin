extends Node2D

@export var timer_text: String


# Called when the node enters the scene tree for the first time.
func _ready():
	$OverallTimer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$TimeLeftLabel.text= str($Timer.time_left)
	$TimeLeftLabel.text = "%d:%02d" % [floor($OverallTimer.time_left / 60), int($OverallTimer.time_left) % 60]
	timer_text = $TimeLeftLabel.text


func _on_timer_timeout():
	print("all done")



