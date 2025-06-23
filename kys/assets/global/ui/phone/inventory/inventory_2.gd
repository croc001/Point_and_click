extends Control

signal opened
signal closed

var isOpen: bool = false

@onready var inventory: Inventory = preload("res://assets/global/ui/phone/inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	inventory.updated.connect(update)
	connectSlots()
	call_deferred("update")

func connectSlots():
	for slot in slots:
		if slot is Button:
			slot.pressed.connect(Callable(onSlotClicked).bind(slot))
		else:
			push_warning("Slot ist kein Button: %s" % slot.name)

func update():
	for i in range(slots.size()):
		var inventoryItem: InventoryItem = null
		if i < inventory.items.size():
			inventoryItem = inventory.items[i]
		slots[i].update(inventoryItem)

func open():
	visible = true
	isOpen = true
	opened.emit()

func close():
	visible = false
	isOpen = false
	closed.emit()

func onSlotClicked(slot):
	print("Slot gedrückt: ", slot.name)
