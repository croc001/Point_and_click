extends Interactable_object_button

func _ready() -> void:
	super._ready()
	connect("pressed", Callable(self,"_on_pressed"))
	
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scripts/cases/00_tutorial/scenes/tuto_school/tuto_school.tscn")
