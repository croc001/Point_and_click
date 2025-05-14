extends CanvasLayer

func _ready():
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory_menu"):
		visible = not visible
		get_tree().paused = visible
