extends Area2D

func _ready() -> void:
	# Sichtbarkeit basierend auf globalem Zustand
	if GlobalVar.phone_collected:
		visible = false
		set_deferred("monitoring", false)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Falls noch nicht erlaubt, abbrechen
		if not GlobalVar.investigator_dialogue_is_over:
			print("Du solltest erst mit John sprechen.")
			return

		# Status setzen, Sichtbarkeit beenden
		GlobalVar.phone_collected = true

		var phone_ui = get_node("/root/DetectivePhone")
		if phone_ui:
			phone_ui.visible = true
			phone_ui._open_phone()

		queue_free()

#@export var itemRes: InventoryItem
#func collect(inventory: Inventory):
	#inventory.insert(itemRes)
	#queue_free()
