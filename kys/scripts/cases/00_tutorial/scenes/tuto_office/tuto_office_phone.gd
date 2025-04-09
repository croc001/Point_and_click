extends Button

@onready var hover_cursor = $SpinningCursor2
var call_res = load("res://assets/cases/00_tutorial/scenes/tuto_office/dialogue/phone_call.dialogue")
var basic_cursor = preload("res://assets/global/cursor/cursor_basic.png")

func _ready() -> void:
	Input.set_custom_mouse_cursor(basic_cursor)
	if hover_cursor:
		hover_cursor.hide()
		hover_cursor.z_index = 100
		hover_cursor.modulate.a = 1.0  # Sicherheit: volle Sichtbarkeit
		hover_cursor.scale = Vector2(1, 1)
		if hover_cursor.sprite_frames:
			print("Available animations: ", hover_cursor.sprite_frames.get_animation_names())
	else:
		print("Error: Hover cursor not found at path ", $SpinningCursor2)

func _on_pressed() -> void:
	$"../phone_ring".free()
	DialogueManager.show_dialogue_balloon(call_res, "phone_call")
	print("Telefon gedrückt")
	GlobalVar.phone_is_answered = true

func _on_mouse_entered() -> void:
	print("Mouse entered phone button")
	show_hover_animation()

func _on_mouse_exited() -> void:
	print("Mouse exited phone button")
	hide_hover_animation()

func show_hover_animation() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if hover_cursor:
		if hover_cursor.sprite_frames and hover_cursor.sprite_frames.has_animation("cursor_spinning2"):
			hover_cursor.global_position = get_viewport().get_mouse_position()
			hover_cursor.play("cursor_spinning2")
			hover_cursor.show()
			print("Showing hover animation")
		else:
			print("Error: Animation 'cursor_spinning2' not found")
	else:
		print("Error: Hover cursor is null")

func hide_hover_animation() -> void:
	if hover_cursor:
		hover_cursor.stop()
		hover_cursor.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(delta: float) -> void:
	# Cursor-Position zur Maus synchronisieren
	if hover_cursor and hover_cursor.visible:
		hover_cursor.global_position = get_viewport().get_mouse_position()
