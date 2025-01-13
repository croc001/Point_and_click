extends Node2D
@onready var lock = $lock
@onready var lockpick = $lockpick

# References to lockpick and lock
#var lockpick = load("res://scripts/global/mechanics/lockpick/lockpick.png")
#var lock = load("res://scripts/global/mechanics/lockpick/lock.jpg")
#var unlock_sound: AudioStreamPlayer

# Lockpick settings
var lock_angle: float = randf_range(0.0, 180.0) # Random angle for the sweet spot
var tolerance: float = 15.0 # Angle tolerance for success
var lockpick_rotation_speed: float = 1.5 # Speed to rotate lockpick
var lock_turn_speed: float = 32.0 # Speed to turn lock

# Lock rotation progress
var lock_turn_progress: float = 0.0
var is_unlocked: bool = false

func _ready():
	randomize() # Initialize RNG for lock position
	lockpick.rotation_degrees = 0.0
	lock.rotation_degrees = 0.0

func _process(delta: float):
	if is_unlocked:
		return

	# Rotate the lockpick using the left and right arrow keys
	if Input.is_action_pressed("ui_left"):
		lockpick.rotation_degrees -= lockpick_rotation_speed
	elif Input.is_action_pressed("ui_right"):
		lockpick.rotation_degrees += lockpick_rotation_speed

	# Clamp rotation between 0 and 180 degrees
	lockpick.rotation_degrees = clamp(lockpick.rotation_degrees, 0.0, 180.0)

	# Check for player attempting to turn the lock
	if Input.is_action_pressed("ui_accept"):  # Key = ENTER
		attempt_unlock(delta)
	else:
		lock_turn_progress = max(lock_turn_progress - delta * lock_turn_speed * 2, 0.0)  # Reset lock rotation
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
	#unlock_sound.play()
	print("Unlocked!")
