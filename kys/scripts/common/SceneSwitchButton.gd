extends Interactable_object_button
"""
Generischer Button zum Szenenwechsel
"""

@export var target_scene : PackedScene        # im Inspector auswählen

func _ready() -> void:
	super._ready()
	connect("pressed", Callable(self,"_on_pressed"))

func _on_pressed() -> void:
	print("on pressed")
	if target_scene:
		get_tree().change_scene_to_packed(target_scene)
	else:
		push_warning("%s: target_scene ist leer!" % name)
