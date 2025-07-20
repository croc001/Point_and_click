extends Interactable_object_button

var dialogue = load("res://assets/cases/00_tutorial/scenes/tuto_school_inside/dialogue/teacher_talk.dialogue")

func _ready() -> void:
	pressed.connect(_on_pressed)
	DialogueManager.dialogue_ended.connect(_on_dialogue_finished)


func _on_pressed() -> void:
	if GlobalVar.teacher_dialogue_is_over:
					DialogueManager.show_dialogue_balloon(dialogue, "teacher_barks")
	else:
		DialogueManager.show_dialogue_balloon(dialogue, "teacher_talk")
		
func _on_dialogue_finished(dlg_resource):
	if dlg_resource == dialogue and not GlobalVar.teacher_dialogue_is_over:
		GlobalVar.teacher_dialogue_is_over = true
		print("✅ Lehrer‑Dialog beendet – Evidence‑App entsperrt.")
