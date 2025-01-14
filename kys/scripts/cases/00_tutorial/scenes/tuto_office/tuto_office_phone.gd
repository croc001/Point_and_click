extends Button

@onready var hover_cursor = $SpinningCursor2 # Pfad zu SpinningCursor überprüfen

var call_res = load("res://assets/cases/00_tutorial/scenes/tuto_office/dialogue/phone_call.dialogue")
var basic_cursor = preload("res://assets/global/cursor/cursor_basic.png")
var eye_cursor = preload("res://assets/global/cursor/cursor_eye.png")

func _ready() -> void:
	Input.set_custom_mouse_cursor(basic_cursor)
	print(hover_cursor)  # Gibt den Knoten oder null aus
	
func _on_pressed() -> void:
	$"../phone_ring".free()
	DialogueManager.show_dialogue_balloon(call_res, "phone_call")
	print("Telefon gedrückt")

func show_hover_animation():
	if hover_cursor != null:
		if hover_cursor.has_animation("cursor_spinning"):
			hover_cursor.play("cursor_spinning")  # Spiele die Animation ab
		else:
			print("Animation 'cursor_spinning' not found.")
		hover_cursor.show()  # Zeige das Overlay
		Input.set_custom_mouse_cursor(null)  # System-Cursor vollständig ausblenden
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:
		print("Cannot show hover animation: hover_cursor is null.")

func hide_hover_animation():
	if hover_cursor != null:
		hover_cursor.stop()  # Stoppe die Animation
		hover_cursor.hide()  # Verstecke das Overlay
		Input.set_custom_mouse_cursor(basic_cursor)  # Zeige den benutzerdefinierten Cursor wieder an
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		print("Cannot hide hover animation")

func _on_mouse_entered() -> void:
	show_hover_animation()

func _on_mouse_exited() -> void:
	hide_hover_animation()
