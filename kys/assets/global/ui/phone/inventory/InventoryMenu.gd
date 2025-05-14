extends CanvasLayer
# oder extends Control, je nachdem, was dein Inventar-Root ist

func _ready():
	hide()
	# Wichtig: InventoryMenu soll auch bei Pause Eingaben verarbeiten!
	process_mode = Node.PROCESS_MODE_ALWAYS

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory_menu"):
		visible = not visible
		# Pausiere das Spiel, wenn Inventar offen ist – ansonsten weiterlaufen lassen.
		get_tree().paused = visible
