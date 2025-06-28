extends Interactable_object_button

var dialogue = load("res://assets/cases/00_tutorial/scenes/tuto_icecream_shop_inside/dialogue/icecreamman_talk.dialogue")

func _on_pressed() -> void:
	if GlobalVar.IcyGiovanni_dialogue_is_over == true:
		DialogueManager.show_dialogue_balloon(dialogue, "Bark")
	if GlobalVar.IcyGiovanni_dialogue_is_over == false:
		DialogueManager.show_dialogue_balloon(dialogue, "IcreamTalk")
		GlobalVar.IcyGiovanni_dialogue_is_over = true
