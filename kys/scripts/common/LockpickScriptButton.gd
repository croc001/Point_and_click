extends Interactable_object_button
"""
Button, der erst ein Lockpick-Minigame startet und danach ggf. die Szene wechselt.
"""

@export var target_scene : PackedScene
@export var lockpick_scene : PackedScene  # Minispiel-Szene, im Inspector auswählbar

var lockpick_instance: Node = null

func _ready() -> void:
	super._ready()
	connect("pressed", Callable(self,"_on_pressed"))

func _on_pressed() -> void:
	if lockpick_scene:
		lockpick_instance = lockpick_scene.instantiate()
		get_tree().current_scene.add_child(lockpick_instance)
		lockpick_instance.connect("lockpick_succeeded", Callable(self, "_on_lockpick_success"))
	else:
		push_warning("%s: lockpick_scene ist leer!" % name)

func _on_lockpick_success():
	if target_scene:
		get_tree().change_scene_to_packed(target_scene)
	else:
		push_warning("%s: target_scene ist leer!" % name)
