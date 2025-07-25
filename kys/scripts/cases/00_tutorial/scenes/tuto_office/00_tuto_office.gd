extends Node2D
"""
Zentrale Szene-Logik für den Tutorial-Büroraum.

‣ Verantwortlichkeiten
   • Set-up von Global-Parametern (z. B. Kamera-Limits, Musik)
   • Registrieren von Signals, die andere Nodes an diese Szene senden
   • Aufräumen beim Verlassen der Szene

   ⚠ Wichtig:  Hier findet **keine** per-Frame-Logik statt.
"""

# ─────────────────────────────────────
#  Konfiguration (Inspector-Variablen)
# ─────────────────────────────────────
@export var background_music : AudioStream         # optionale Musik
@export var camera_limits    : Rect2               # Begrenzung für die Kamera
@export var corridor_scene : PackedScene
# ─────────────────────────────────────
#  Lebenszyklus
# ─────────────────────────────────────
func _ready() -> void:
	if GlobalVar.phone_collected == false:
		DetectivePhone.visible = false
	else: 
		
		DetectivePhone.visible = true
		
	# (1) Musik starten, falls gesetzt
	if background_music:
		var player := AudioStreamPlayer.new()
		add_child(player)
		player.stream = background_music
		player.autoplay = true

	# (2) Kamera­begrenzung setzen, wenn vorhanden
	if camera_limits:
		var cam := get_viewport().get_camera_2d()
		if cam:
			cam.limit_left   = camera_limits.position.x
			cam.limit_top    = camera_limits.position.y
			cam.limit_right  = camera_limits.position.x + camera_limits.size.x
			cam.limit_bottom = camera_limits.position.y + camera_limits.size.y

	# (3) Meldung im Debug-Log
	print("Tutorial-Office geladen.")

# ─────────────────────────────────────
#  Signale von Child-Nodes (Beispiele)
# ─────────────────────────────────────
func _on_phone_answered() -> void:
	# Wird vom Telefon-Button getriggert
	GlobalVar.phone_is_answered = true

func _on_exit_requested() -> void:
	# Szene verlassen (Zur Sicherheitsabfrage o. Ä.)
	get_tree().change_scene_to_packed(corridor_scene)  # Beispiel
