# res://scripts/common/SaveLoadMenu.gd
# Controls the on-screen Save/Load overlay.  
# CanvasLayer root means it’s always drawn above the game world.

extends CanvasLayer

@onready var container : VBoxContainer = $Panel/SaveButtonContainer

func _ready() -> void:
	hide()
	_populate_save_buttons()

func _unhandled_input(event: InputEvent) -> void:
	# Toggle overlay when pressing the “L” key
	if event.is_action_pressed("toggle_save_menu"):
		visible = not visible

func _populate_save_buttons() -> void:
	# 1) Remove old buttons
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()
	# 2) Generate one Button per save slot
	for slot_name in SaveManager.get_save_list():
		var btn := Button.new()
		btn.text = slot_name
		btn.toggle_mode = false
		# Bind slot_name into the callback
		var cb := Callable(self, "_on_SlotButton_pressed").bind(slot_name)
		btn.pressed.connect(cb)
		container.add_child(btn)

func _on_SlotButton_pressed(slot_name: String) -> void:
	# Load that slot and then hide the menu
	SaveManager.load_game(slot_name)
	hide()

func _on_SaveButton_pressed() -> void:
	# Write a new auto-incremented slot, refresh list, hide
	SaveManager.save_game()
	_populate_save_buttons()
	hide()
