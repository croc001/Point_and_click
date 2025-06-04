extends CanvasLayer

func _ready():
	inventory.close()
	#hide()
	#process_mode = Node.PROCESS_MODE_ALWAYS

#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("inventory_menu"):
		#visible = not visible
		#get_tree().paused = visible

@onready var inventory = $Inventory2

func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		if inventory.isOpen:
			inventory.close()
		else:
			inventory.open()


func _on_inventory_2_closed() -> void:
	get_tree().paused = false


func _on_inventory_2_opened() -> void:
	get_tree().paused = true
