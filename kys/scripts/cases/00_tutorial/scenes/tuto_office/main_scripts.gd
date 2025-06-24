extends Button

# ─────────────────────────────────────
#  Export‑Variablen – als PackedScene
# ─────────────────────────────────────
@export var clock_scene       : PackedScene = preload("res://assets/cases/00_tutorial/scenes/tuto_office/background/tuto_office_clock.tscn")
@export var pc_scene          : PackedScene = preload("res://assets/cases/00_tutorial/scenes/tuto_office/background/tuto_office_closeup_pc.tscn")
@export var board_scene       : PackedScene = preload("res://assets/cases/00_tutorial/scenes/tuto_office/background/closeup_whiteboard.tscn")
@export var certificate_scene : PackedScene = preload("res://assets/cases/00_tutorial/scenes/tuto_office/background/closeup_certificate.tscn")
@export var register_scene    : PackedScene = preload("res://assets/cases/00_tutorial/scenes/tuto_office/background/closeup_register.tscn")
@export var window_scene      : PackedScene = preload("res://assets/cases/00_tutorial/scenes/tuto_office/background/closeup_window.tscn")
@export var corridor_scene    : PackedScene = preload("res://assets/cases/00_tutorial/scenes/tuto_corridor/background/tuto_corridor.tscn")

# ─────────────────────────────────────
#  Hilfs‑Funktion: Szene nur laden, wenn Referenz gesetzt
# ─────────────────────────────────────
func _safe_change(pscene : PackedScene) -> void:
	if pscene:
		get_tree().change_scene_to_packed(pscene)
	else:
		push_warning("Scene reference is empty!")

# ─────────────────────────────────────
#  Button‑Callbacks
# ─────────────────────────────────────
func _on_pressed() -> void:                   _safe_change(clock_scene)
func _on_pc_pressed() -> void:                _safe_change(pc_scene)
func _on_board_pressed() -> void:             _safe_change(board_scene)
func _on_certificate_pressed() -> void:       _safe_change(certificate_scene)
func _on_register_pressed() -> void:          _safe_change(register_scene)
func _on_window_pressed() -> void:            _safe_change(window_scene)
func _on_door_to_corridor_pressed() -> void:  _safe_change(corridor_scene)

# ─────────────────────────────────────
#  Cursor‑Wechsel beim Hover
# ─────────────────────────────────────
