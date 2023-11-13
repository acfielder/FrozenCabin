extends Node2D

@export var Minigame: PackedScene

func _ready():
	var my_minigame:Minigame = Minigame.instantiate()
	my_minigame.setup("res://minigame/eat_game.tscn")
	add_child(my_minigame)
