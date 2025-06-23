extends Button

@onready var backgroundSprite: Sprite2D = $background
@onready var ItemStackGuiClass = preload("res://assets/global/ui/phone/inventory/itemsStackGui.tscn")

func update(inventoryItem: InventoryItem):
	# Erstmal alles alte entfernen:
	if get_child_count() > 1:
		for child in get_children():
			if child is ItemStackGui:
				child.queue_free()

	# Wenn leer, Hintergrund zurücksetzen:
	if inventoryItem == null or inventoryItem.texture == null:
		backgroundSprite.frame = 0
		return

	# Wenn Item vorhanden, Hintergrund ändern und ItemStackGui hinzufügen
	backgroundSprite.frame = 1
	var itemGui = ItemStackGuiClass.instantiate()
	add_child(itemGui)

	# ZENTRIERUNG:
	var slot_size = get_size()
	var item_size = itemGui.get_size()
	itemGui.position = (slot_size - item_size) / 2

	# Übergabe der Daten und Update
	itemGui.inventorySlot = inventoryItem
	itemGui.update()
