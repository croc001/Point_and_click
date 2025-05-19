extends Button

var eye_cursor = preload("res://assets/global/cursor/cursor_eye.png")
var default_cursor = preload("res://assets/global/cursor/cursor_basic.png")

func _ready() -> void:
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))

func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(eye_cursor)

func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(default_cursor)
