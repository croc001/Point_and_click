extends Interactable_object_button

@onready var phone_ui = get_tree().get_root().get_node("res://assets/global/ui/phone/detective_phone.tscn")

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	if not GlobalVar.investigator_dialogue_is_over:
		print("Du solltest erst mit John sprechen.")
		return  # ❗ Frühzeitig abbrechen, wenn Flag nicht erfüllt

	GlobalVar.phone_collected = true

	var phone_ui = get_node("/root/DetectivePhone")
	if phone_ui:
		phone_ui.visible = true
		phone_ui._open_phone()

	queue_free()
