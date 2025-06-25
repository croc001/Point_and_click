extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
func _physics_process(delta: float) -> void:
	global_position = lerp(global_position, get_global_mouse_position(), 16.5 * delta)
	
func set_cursor_state(state: String):
	if state in ["cursor_eye", "idle"]:
		animation = state
		frame = 0
		stop()  # Nicht abspielen, sonst flackert
	else :
		play(state)
		print("Ich kann das alles nichtmehr")
