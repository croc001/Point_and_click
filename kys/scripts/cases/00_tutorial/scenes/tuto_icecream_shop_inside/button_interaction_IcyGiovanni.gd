extends Button

var dialogue = load("res://assets/cases/00_tutorial/scenes/tuto_icecream_shop_inside/dialogue/icecreamman_talk.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if GlobalVar.IcyGiovanni_dialogue_is_over == true:
		DialogueManager.show_dialogue_balloon(dialogue, "Bark")
	if GlobalVar.IcyGiovanni_dialogue_is_over == false:
		DialogueManager.show_dialogue_balloon(dialogue, "IcreamTalk")
		GlobalVar.IcyGiovanni_dialogue_is_over = true
	
	
	pass # Replace with function body.
