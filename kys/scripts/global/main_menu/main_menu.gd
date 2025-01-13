extends Control

@onready var background_animation = $background_animation
@onready var hover_cursor = $SpinningCursor  # Referenz zum AnimatedSprite2D-Overlay

# Benutzercursor-Texturen
var basic_cursor = preload("res://assets/global/cursor/cursor_basic.png")
var eye_cursor = preload("res://assets/global/cursor/cursor_eye.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background_animation.play("default")
	# Stelle sicher, dass der benutzerdefinierte Cursor beim Start sichtbar ist
	Input.set_custom_mouse_cursor(basic_cursor)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Hier setzen wir die Position nur für den animierten Cursor
	if hover_cursor.visible:
		hover_cursor.position = get_viewport().get_mouse_position()  # Nur den animierten Cursor bewegen

func _on_new_game_pressed() -> void:
	$new_game/MainNewGameButton.play()
	await _delayed_scene_change_new_game()
	get_tree().change_scene_to_file("res://scripts/cases/00_tutorial/scenes/tuto_office/00_tuto_office.tscn")
	# Stelle sicher, dass der Mauszeiger nach dem Szenenwechsel wieder sichtbar ist
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	# Setze den benutzerdefinierten Cursor nach dem Szenenwechsel
	Input.set_custom_mouse_cursor(basic_cursor)

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

# Funktion zum Anzeigen der Hover-Animation
func show_hover_animation():
	hover_cursor.play("cursor_spinning")  # Spiele die Animation auf dem AnimatedSprite2D ab
	hover_cursor.show()  # Zeige das Overlay
	# Cursor ausblenden
	Input.set_custom_mouse_cursor(null)  # Standard-Cursor vollständig ausblenden
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)  # System-Cursor ausblenden

# Funktion zum Verstecken der Hover-Animation
func hide_hover_animation():
	hover_cursor.stop()  # Stoppe die Animation
	hover_cursor.hide()  # Verstecke das Overlay
	# Den normalen Cursor wieder anzeigen
	Input.set_custom_mouse_cursor(basic_cursor)  # Zeige den benutzerdefinierten Cursor wieder an
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Zeige den System-Cursor wieder an

func _on_mouse_entered() -> void:
	hide_hover_animation()

func _on_mouse_exited() -> void:
	show_hover_animation()
