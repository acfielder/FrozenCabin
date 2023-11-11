extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var stlevel = load("res://LevelScenes/start_game.tscn").instantiate()
	get_tree().get_root().add_child(stlevel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	queue_free()
