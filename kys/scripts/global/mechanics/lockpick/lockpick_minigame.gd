extends Node2D

@onready var lock = $lock
@onready var lockpick = $lockpick

# --- Einstellungen ---
var lock_angle: float = randf_range(-90.0, 90.0)  # Zielwinkel zum Entsperren
var tolerance: float = 15.0  # Wie genau muss der Spieler treffen?
var lockpick_rotation_speed: float = 1.5
var lock_turn_speed: float = 32.0

# --- Statusvariablen ---
var lock_turn_progress: float = 0.0
var is_unlocked: bool = false
var player_set_rotation: float = 0.0
var lockpick_modified_by_unlock: bool = false

func _ready():
	randomize()
	lockpick.rotation_degrees = 0.0
	lock.rotation_degrees = 0.0
	player_set_rotation = 0.0

func _process(delta: float):
	if is_unlocked:
		return

	# --- Spieler bewegt den Dietrich ---
	var rotating = false
	if Input.is_action_pressed("ui_left"):
		lockpick.rotation_degrees -= lockpick_rotation_speed
		rotating = true
	elif Input.is_action_pressed("ui_right"):
		lockpick.rotation_degrees += lockpick_rotation_speed
		rotating = true

	lockpick.rotation_degrees = clamp(lockpick.rotation_degrees, -90.0, 90.0)

	if rotating:
		player_set_rotation = lockpick.rotation_degrees
		lockpick_modified_by_unlock = false

	# --- Spieler versucht zu entsperren ---
	if Input.is_action_pressed("ui_accept"):  # ENTER
		attempt_unlock(delta)
	else:
		# Schloss dreht zurück
		lock_turn_progress = max(lock_turn_progress - delta * lock_turn_speed * 2, 0.0)
		lock.rotation_degrees = lock_turn_progress

		# Dietrich kehrt nur zurück, wenn er durch den Unlock verändert wurde
		if lockpick_modified_by_unlock:
			lockpick.rotation_degrees = lerp(lockpick.rotation_degrees, player_set_rotation, delta * 5.0)

func attempt_unlock(delta: float):
	var angle_diff = abs((lockpick.rotation_degrees - lock.rotation_degrees) - lock_angle)

	if angle_diff <= tolerance:
		# Schloss wird gedreht
		lock_turn_progress += delta * lock_turn_speed
		lock.rotation_degrees = lock_turn_progress

		# Dietrich wird "mitgedreht"
		lockpick.rotation_degrees += delta * lock_turn_speed * 0.5
		lockpick_modified_by_unlock = true

		if lock_turn_progress >= 90.0:
			unlock()
	else:
		# Wenn zu weit weg → Schloss dreht zurück
		lock_turn_progress = max(lock_turn_progress - delta * lock_turn_speed * 2, 0.0)
		lock.rotation_degrees = lock_turn_progress

signal lockpick_succeeded  # <- GANZ OBEN hinzufügen

func unlock():
	is_unlocked = true
	print("Unlocked!")
	emit_signal("lockpick_succeeded")
	queue_free()  
