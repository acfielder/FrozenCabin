extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "You Win!\n" + global.winReason
	if global.winReason == "someone dug you out":
		$Savior.visible = true
	else:
		$Savior.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
