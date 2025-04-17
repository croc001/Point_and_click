extends CanvasLayer

@onready var animated_cursor = $AnimatedCursor

func _ready() -> void:
	# Zu Beginn ausgeblendet, damit der Cursor nicht immer an ist:
	animated_cursor.hide()

func show_cursor_spinning():
	# System-Cursor unsichtbar schalten:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	# Animation abspielen:
	if animated_cursor and animated_cursor.sprite_frames and animated_cursor.sprite_frames.has_animation("cursor_spinning"):
		animated_cursor.global_position = get_viewport().get_mouse_position()
		animated_cursor.show()
		animated_cursor.play("cursor_spinning")
	else:
		print("GlobalCursor.gd: 'cursor_spinning' nicht gefunden oder kein AnimatedSprite2D vorhanden!")

func hide_cursor():
	# System-Cursor wieder anzeigen:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if animated_cursor:
		animated_cursor.stop()
		animated_cursor.hide()

func _process(delta: float) -> void:
	# Wenn der Cursor sichtbar ist, ständig Mausposition aktualisieren
	if animated_cursor and animated_cursor.visible:
		animated_cursor.global_position = get_viewport().get_mouse_position()
