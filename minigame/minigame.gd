class_name Minigame extends Node2D

# to be called before using the minigame
func setup(minigame_path:String):
	add_child(load(minigame_path).instantiate())
	
func _ready():
	$MinigameTimer.one_shot = true
	$MinigameTimer.start(60)
	
func _process(delta:float):
	$MinigameHud/TimerDisplay.text = str(int($MinigameTimer.time_left))
