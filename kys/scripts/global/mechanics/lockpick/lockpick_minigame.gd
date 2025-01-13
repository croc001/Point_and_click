extends Node2D

# References to lockpick and lock
@export var lockpick: Sprite2D
@export var lock: Sprite2D
@export var unlock_sound: AudioStreamPlayer

# Lockpick settings
var lock_angle: float = randf_range(0.0, 180.0) # Random angle for the sweet spot
var tolerance: float = 15.0 # Angle tolerance for success
var lock_turn_speed: float = 2.0 # Speed to turn lock
var sensitivity: float = 0.1 # Mouse movement sensitivity

# Lock rotation progress
var lock_turn_progress: float = 0.0
var is_unlocked: bool = false

# Store previous mouse position
var previous_mouse_position: Vector2 = Vector2.ZERO

func _ready():
	randomize() # Initialize RNG for lock position
	lockpick.rotation_degrees = 0.0
	lock.rotation_degrees = 0.0
	previous_mouse_position = get_viewport().get_mouse_position()

func _process(delta: float):
	if is_unlocked:
		return

	# Get mouse motion delta and adjust the lockpick's rotation
	var current_mouse_position = get_viewport().get_mouse_position()
	var mouse_delta = current_mouse_position.x - previous_mouse_position.x
	previous_mouse_position = current_mouse_position

	lockpick.rotation_degrees += mouse_delta * sensitivity

	# Ensure rotation is clamped within 0 to 180 degrees
	lockpick.rotation_degrees = lockpick.rotation_degrees180

	# Check for player attempting to turn the lock
	if Input.is_action_pressed("ui_accept"):
		attempt_unlock(delta)
	else:
		lock_turn_progress = max(lock_turn_progress - delta * lock_turn_speed * 2, 0.0) # Reset lock rotation
		lock.rotation_degrees = lock_turn_progress

func attempt_unlock(delta: float):
	# Calculate the distance between lockpick angle and lock sweet spot
	var angle_difference = abs(lockpick.rotation_degrees - lock_angle)

	if angle_difference <= tolerance:
		lock_turn_progress += delta * lock_turn_speed
		lock.rotation_degrees = lock_turn_progress

		if lock_turn_progress >= 90.0: # Fully unlocked
			unlock()
	else:
		lock_turn_progress = max(lock_turn_progress - delta * lock_turn_speed * 2, 0.0)
		lock.rotation_degrees = lock_turn_progress

func unlock():
	is_unlocked = true
	unlock_sound.play()
	print("Unlocked!")
