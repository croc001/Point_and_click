extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/cases/00_tutorial/scenes/tuto_office/background/tuto_office_clock.tscn")

func _on_pc_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/cases/00_tutorial/scenes/tuto_office/background/tuto_office_closeup_pc.tscn")
	
func _on_board_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/cases/00_tutorial/scenes/tuto_office/background/closeup_whiteboard.tscn")

func _on_certificate_pressed() -> void:
	get_tree().change_scene_to_file("res://closeup_certificate.tscn")



func _on_register_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/cases/00_tutorial/scenes/tuto_office/background/closeup_register.tscn")


func _on_window_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/cases/00_tutorial/scenes/tuto_office/background/closeup_window.tscn")
