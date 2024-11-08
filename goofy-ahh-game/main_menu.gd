extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn")
	pass # Replace with function body.


func _on_load_game_pressed() -> void:
	get_tree().change_scene_to_file("res://load_game.tscn")
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
