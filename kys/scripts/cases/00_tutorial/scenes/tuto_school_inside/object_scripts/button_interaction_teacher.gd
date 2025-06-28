extends Interactable_object_button

var dialogue = load("res://assets/cases/00_tutorial/scenes/tuto_school_inside/dialogue/teacher_talk.dialogue")

func _pressed() -> void:
	if GlobalVar.teacher_dialogue_is_over == false:
		DialogueManager.show_dialogue_balloon(dialogue, "teacher_talk")
		GlobalVar.teacher_dialogue_is_over = true
	
