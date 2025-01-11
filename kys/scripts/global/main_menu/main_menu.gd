extends Control

@onready var background_animation = $background_animation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background_animation.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_game_pressed() -> void:
	$new_game/MainNewGameButton.play()
	await _delayed_scene_change_new_game()
	get_tree().change_scene_to_file("res://scripts/cases/00_tutorial/scenes/tuto_office/00_tuto_office.tscn")
	
func _delayed_scene_change_new_game() -> void:
	await get_tree().create_timer(0.8).timeout
func _delayed_scene_change() -> void:
	await get_tree().create_timer(0.4).timeout

func _on_settings_pressed() -> void:
	$settings/MainPressButton.play()
	await _delayed_scene_change()
	get_tree().change_scene_to_file("res://scripts/global/ui/settings.tscn")

func _on_saved_games_pressed() -> void:
	$saved_games/MainPressButton.play()
	await _delayed_scene_change()
	get_tree().change_scene_to_file("res://scripts/global/ui/saved_games.tscn")

func _on_quit_to_os_pressed() -> void:
	$quit_to_os/MainPressButton.play()
	await _delayed_scene_change()
	get_tree().quit()
