extends Button
"""
Generischer Button zum Szenenwechsel + Hover-Cursor.
"""

@export var target_scene : PackedScene        # im Inspector auswählen

func _on_mouse_entered(): CursorManager.set_eye()
func _on_mouse_exited():  CursorManager.set_basic()

func _on_pressed() -> void:
	if target_scene:
		get_tree().change_scene_to_packed(target_scene)
	else:
		push_warning("%s: target_scene ist leer!" % name)
