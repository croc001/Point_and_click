extends AnimatedSprite2D

func _ready():
	# Das Overlay ist standardmäßig unsichtbar
	hide()

func _process(delta: float):
	# Folge der Mausposition
	position = get_viewport().get_mouse_position()

func hide_hover_animation():
	stop()  # Stoppe die Animation
	hide()  # Verstecke das Overlay
