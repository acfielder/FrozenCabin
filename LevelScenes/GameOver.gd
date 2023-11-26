extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Game Over\nYou died due to\n" + global.causeOfDeath



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
