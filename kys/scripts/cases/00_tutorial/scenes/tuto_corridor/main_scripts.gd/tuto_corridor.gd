extends Node2D

var dialogue = load("res://assets/cases/00_tutorial/scenes/tuto_corridor/dialogue/Investigator.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DetectivePhone.visible = false
	if GlobalVar.investigator_dialogue_is_over == false:
		DialogueManager.show_dialogue_balloon(dialogue,"Investigator_dialogue")
		GlobalVar.investigator_dialogue_is_over = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
