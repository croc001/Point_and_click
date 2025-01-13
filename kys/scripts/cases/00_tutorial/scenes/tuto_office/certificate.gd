extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var basic_cursor = preload("res://assets/global/cursor/cursor_basic.png")
var eye_cursor = preload("res://assets/global/cursor/cursor_eye.png")

func _on_mouse_entered() -> void:
	# Ändere den Cursor, wenn über den Button gehovert wird
	Input.set_custom_mouse_cursor(eye_cursor)

func _on_mouse_exited() -> void:
	# Setze den Standardcursor zurück, wenn der Mauszeiger den Button verlässt
	Input.set_custom_mouse_cursor(basic_cursor)
