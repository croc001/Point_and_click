extends Area2D

func _ready() -> void:
	if GlobalVar.box_collected:
		visible = false
		set_deferred("monitoring", false)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		GlobalVar.box_collected = true
		queue_free()
