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


func _on_door_to_corridor_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/cases/00_tutorial/scenes/tuto_corridor/background/tuto_corridor.tscn")


var basic_cursor = preload("res://assets/global/cursor/cursor_basic.png")
var eye_cursor = preload("res://assets/global/cursor/cursor_eye.png")

func _on_mouse_entered() -> void:
	# Ändere den Cursor, wenn über den Button gehovert wird
	Input.set_custom_mouse_cursor(eye_cursor)

func _on_mouse_exited() -> void:
	# Setze den Standardcursor zurück, wenn der Mauszeiger den Button verlässt
	Input.set_custom_mouse_cursor(basic_cursor)
