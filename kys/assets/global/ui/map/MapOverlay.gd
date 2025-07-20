# MapOverlay.gd
extends CanvasLayer

func _ready() -> void:
	hide()  # standardmäßig ausblenden
	
	$Button_school.disabled = not GlobalVar.can_access_school()
	$Button_icecream_shop.disabled = not GlobalVar.can_access_icecream()
	$Button_forest.disabled = not GlobalVar.can_access_forest()
	
	if $Button_icecream_shop.disabled:
		$Button_icecream_shop.tooltip_text = "Finde erst alle Hinweise in der Schule."

	if $Button_forest.disabled:
		$Button_forest.tooltip_text = "Löse den Fall in der Eisdiele, um weiterzukommen."

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_map"):  # Taste M im Input Map
		visible = not visible
		
func _on_button_forest_pressed() -> void:
	hide()
	get_tree().change_scene_to_file("res://scripts/cases/00_tutorial/scenes/tuto_forest_trail_1/forest_trail_1.tscn")


func _on_button_school_pressed() -> void:
	hide()
	get_tree().change_scene_to_file("res://scripts/cases/00_tutorial/scenes/tuto_school/tuto_school.tscn")


func _on_button_office_pressed() -> void:
	hide()
	get_tree().change_scene_to_file("res://scripts/cases/00_tutorial/scenes/tuto_office/00_tuto_office.tscn")


func _on_button_icecream_shop_pressed() -> void:
	hide()
	get_tree().change_scene_to_file("res://scripts/cases/00_tutorial/scenes/tuto_icecreamshop_outside/tuto_icecream_outside.tscn")


func _on_button_forest_focus_entered() -> void:
	pass # Replace with function body.
	
	
