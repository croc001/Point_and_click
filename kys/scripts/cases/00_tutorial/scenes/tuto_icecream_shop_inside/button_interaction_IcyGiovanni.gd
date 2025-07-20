extends Interactable_object_button

var dialogue = load("res://assets/cases/00_tutorial/scenes/tuto_icecream_shop_inside/dialogue/icecreamman_talk.dialogue")

func _ready() -> void:
	pressed.connect(_on_pressed)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _on_pressed() -> void:
	if GlobalVar.icygiovanni_dialogue_is_over == true:
		DialogueManager.show_dialogue_balloon(dialogue, "Bark")
	if GlobalVar.icygiovanni_dialogue_is_over == false:
		DialogueManager.show_dialogue_balloon(dialogue, "IcreamTalk")
		GlobalVar.icygiovanni_dialogue_is_over = true

func _on_dialogue_ended(resource: DialogueResource) -> void:
	if resource == dialogue and not GlobalVar.icygiovanni_dialogue_is_over:
		GlobalVar.icygiovanni_dialogue_is_over = true
		print("✅ Eisverkäufer‑Dialog beendet – Evidence‑App entsperrt.")
		DialogueManager.dialogue_ended.disconnect(_on_dialogue_ended)
