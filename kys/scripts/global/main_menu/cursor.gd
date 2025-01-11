extends Node


func _on_Area2D_mouse_entered():
	# Setze den benutzerdefinierten Cursor beim Hover
	Input.set_custom_mouse_cursor(
		load("res://assets/global/cursor/ahhhhh.png"),  # Richtig: 'load' statt 'Load'
		Input.CursorShape.CURSOR_WAIT
	)
