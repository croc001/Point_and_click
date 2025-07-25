extends Interactable_object_button

var call_res = load("res://assets/cases/00_tutorial/scenes/tuto_office/dialogue/phone_call.dialogue")
var has_been_used := false

func _ready() -> void:
	cursor_hover_state = "cursor_spinning"

func _on_pressed() -> void:
	if has_been_used:
		return

	has_been_used = true
	var ring_node = get_node_or_null("../phone_ring")
	if ring_node:
		ring_node.free()
	# Starte den Dialog (Telefonanruf)
	DialogueManager.show_dialogue_balloon(call_res, "phone_call")
	print("Telefon gedrückt")
	GlobalVar.phone_is_answered = true

func _process(delta: float) -> void:
	# Keine lokale Cursor-Logik mehr nötig,
	# der globale Cursor wird in GlobalCursor.gd gesteuert
	pass
