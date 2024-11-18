extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_tuto_inves_büro_window_pressed() -> void:
	get_tree().change_scene_to_file("res://Tutorial/Tutorial Szenes/tuto_invis_window.tscn")
	

func _on_tuto_invis_door_outside_pressed() -> void:
	get_tree().change_scene_to_file("res://Tutorial/Tutorial Szenes/tuto_invis_door.tscn")


func _on_tuto_invis_evidence_board_pressed() -> void:
	get_tree().change_scene_to_file("res://Tutorial/Tutorial Szenes/tuto_invis_evidence_board.tscn")


func _on_tuto_invis_pc_pressed() -> void:
	get_tree().change_scene_to_file("res://Tutorial/Tutorial Szenes/tuto_invis_pc.tscn")


func _on_button_test_pressed() -> void:
	get_tree().change_scene_to_file("res://Tutorial/Tutorial Szenes/test.tscn")
