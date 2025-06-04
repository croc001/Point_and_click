extends Button

var dialogue = load("res://assets/cases/00_tutorial/scenes/tuto_school_inside/dialogue/teacher_talk.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _pressed() -> void:
	if GlobalVar.teacher_dialogue_is_over == false:
		DialogueManager.show_dialogue_balloon(dialogue, "teacher_talk")
