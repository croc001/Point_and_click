extends Button
"""
Generischer Button zum Szenenwechsel + Hover-Cursor.
"""

@export var target_scene : PackedScene        # im Inspector auswählen


func _on_pressed() -> void:
	if target_scene:
		get_tree().change_scene_to_packed(target_scene)
	else:
		push_warning("%s: target_scene ist leer!" % name)
