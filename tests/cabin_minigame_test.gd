extends Node2D

@export var Minigame: PackedScene
var cabin = null
var current_minigame:Minigame = null

func _ready():
	$cabin/MainDude.start_minigame.connect(on_start_minigame)
	cabin = $cabin
	
	
func on_start_minigame(minigame_path):
	current_minigame = Minigame.instantiate()
	current_minigame.setup("res://minigame/eat_game.tscn")
	remove_child(cabin)
	add_child(current_minigame)
	$minigame/MinigameHud/Button.pressed.connect(on_return_to_cabin)
	
func on_return_to_cabin():
	remove_child(current_minigame)
	add_child(cabin)
