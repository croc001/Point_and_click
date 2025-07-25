extends Control

var call_res = load("res://assets/cases/00_tutorial/scenes/tuto_end/Dialogue/end_dialog.dialogue")

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(call_res, "end_dialog")
	await DialogueManager.dialogue_ended
	await wait(2)
	call_deferred("_Thanks_for_playing")
	
func _Thanks_for_playing():
	DialogueManager.show_dialogue_balloon(call_res, "thanks_for_playing")
	await DialogueManager.dialogue_ended
	get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
