extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Called when the "New Game" button is pressed
func _on_new_game_pressed() -> void:
	$New_Game/main_new_game_button.play()
	# Delay the scene change to let the audio play
	await _delayed_scene_change()
	get_tree().change_scene_to_file("res://Tutorial/Tutorial Szenes/tuto_investigator_buero.tscn")

func _delayed_scene_change() -> void:
	await get_tree().create_timer(0.8).timeout

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Tutorial/Tutorial Szenes/settings.tscn")

func _on_load_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Tutorial/Tutorial Szenes/Load_Game_new.tscn")

func _on_quit_to_os_pressed() -> void:
	$main_press_button.play()
	await _delayed_scene_change()
	get_tree().quit()
