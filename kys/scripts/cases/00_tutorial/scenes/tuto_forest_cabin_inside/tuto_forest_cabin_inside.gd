extends Node2D

var call_res = load("res://assets/cases/00_tutorial/scenes/tuto_forest_cabin_inside/dialogue/cabin_inside_dialogue.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(call_res, "inicial_entering")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
