extends Panel

class_name ItemStackGui

@onready var itemSprite: Sprite2D = $item

var inventorySlot: InventoryItem

func update():
	if !inventorySlot or !inventorySlot.texture:
		itemSprite.visible = false
		return
	
	itemSprite.visible = true
	itemSprite.texture = inventorySlot.texture
