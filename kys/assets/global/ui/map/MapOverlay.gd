# MapOverlay.gd
extends CanvasLayer

func _ready() -> void:
	hide()  # standardmäßig ausblenden

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_map"):  # Taste M im Input Map
		visible = not visible
