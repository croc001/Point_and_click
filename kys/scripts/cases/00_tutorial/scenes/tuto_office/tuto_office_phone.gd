extends Button

var call_res = load("res://assets/cases/00_tutorial/scenes/tuto_office/dialogue/phone_call.dialogue")
var basic_cursor = preload("res://assets/global/cursor/cursor_basic.png")

func _ready() -> void:
	# Wenn du magst, setzt du beim Start einen Standard-Cursor
	Input.set_custom_mouse_cursor(basic_cursor)

func _on_pressed() -> void:
	# Lösche den Ring-Sound-Player (wenn er noch abgespielt wird)
	$"../phone_ring".free()
	# Starte den Dialog (Telefonanruf)
	DialogueManager.show_dialogue_balloon(call_res, "phone_call")
	print("Telefon gedrückt")
	GlobalVar.phone_is_answered = true

func _on_mouse_entered() -> void:
	print("Mouse entered phone button")
	# Globalen Cursor aktivieren (animierte Lupe)
	GlobalCursor.show_cursor_spinning()

func _on_mouse_exited() -> void:
	print("Mouse exited phone button")
	# Globalen Cursor ausblenden, System-Cursor wieder anzeigen
	GlobalCursor.hide_cursor()

func _process(delta: float) -> void:
	# Keine lokale Cursor-Logik mehr nötig,
	# der globale Cursor wird in GlobalCursor.gd gesteuert
	pass
