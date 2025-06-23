extends Node2D

var interact_dialogue = load("res://assets/cases/00_tutorial/scenes/tuto_office/dialogue/inspect_objects.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(interact_dialogue, "inspect_certificate")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
