extends Node2D

@export var display_time : float = 1
@export var text_to_show : String = "text"

@onready var pop_up_scene = load("res://BedScene.tscn")

func _on_Button_pressed():
	var new_pop_up = pop_up_scene.instance()
	new_pop_up.show_time = display_time
	new_pop_up.text_to_show = text_to_show
	add_child(new_pop_up)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
