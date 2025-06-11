extends Node





func _on_Area2D_mouse_entered():
	# Setze den benutzerdefinierten Cursor beim Hover
	Input.set_custom_mouse_cursor(
		load("res://assets/global/cursor/cursor_eye.png"),
		Input.CursorShape.CURSOR_WAIT
	)
