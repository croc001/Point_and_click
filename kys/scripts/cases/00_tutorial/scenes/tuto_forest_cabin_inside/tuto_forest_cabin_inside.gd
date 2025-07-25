extends Node2D
@onready var black_fade := $BlackFade
var call_res = load("res://assets/cases/00_tutorial/scenes/tuto_forest_cabin_inside/dialogue/cabin_inside_dialogue.dialogue")


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func fade_to_black():
	print("fading started")
	black_fade.visible = true
	black_fade.modulate = Color(0, 0, 0, 0)
	black_fade.size = get_viewport_rect().size  # start fully transparent

	var duration := 1.5
	var time_passed := 0.0

	while time_passed < duration:
		time_passed += get_process_delta_time()
		var alpha: float = clamp(time_passed / duration, 0.0, 1.0)
		black_fade.modulate.a = alpha
		await get_tree().process_frame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(call_res, "inicial_entering")

func _on_book_tree_exiting() -> void:
	call_deferred("_show_cursed_book_dialogue")
	
func _show_cursed_book_dialogue():
	DialogueManager.show_dialogue_balloon(call_res, "collectedCursedBook")
	await DialogueManager.dialogue_ended
	await wait(2)
	call_deferred("_show_call_to_HQ")
	
func _show_call_to_HQ():
	DialogueManager.show_dialogue_balloon(call_res, "call_to_HQ")
	await DialogueManager.dialogue_ended
	fade_to_black()
	await wait(4)
	call_deferred("_show_leave_cabin")
	
func _show_leave_cabin():
	DialogueManager.show_dialogue_balloon(call_res, "leave_cabin")
	await DialogueManager.dialogue_ended
	await wait(2)
	get_tree().change_scene_to_file("res://scripts/cases/00_tutorial/scenes/interrogation/interrogation1.tscn")
