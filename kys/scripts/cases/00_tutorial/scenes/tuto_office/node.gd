extends Node

var basic_cursor = preload("res://assets/global/cursor/cursor_basic.png")
var eye_cursor = preload("res://assets/global/cursor/cursor_eye.png")

func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(eye_cursor)

func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(basic_cursor)
