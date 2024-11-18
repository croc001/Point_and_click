extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Leave Loadgames to main menu
func _on_go_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Tutorial/Tutorial Szenes/main_menu.tscn")
