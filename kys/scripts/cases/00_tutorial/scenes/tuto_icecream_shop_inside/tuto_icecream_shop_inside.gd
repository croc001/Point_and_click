extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_icecream_shop_outside_pressed() -> void:
	get_tree().change_scene_to_file("res://scripts/cases/00_tutorial/scenes/tuto_icecreamshop_outside/tuto_icecream_outside.tscn")
