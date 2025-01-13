extends Button
var call_res = load("res://assets/cases/00_tutorial/scenes/tuto_office/dialogue/phone_call.dialogue")
var basic_cursor = preload("res://assets/global/cursor/cursor_basic.png")
var eye_cursor = preload("res://assets/global/cursor/cursor_eye.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	$"../phone_ring".free()
	DialogueManager.show_dialogue_balloon(call_res, "phone_call")
	print("telefon gedrückt")
