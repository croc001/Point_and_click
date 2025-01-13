extends Timer

@onready var phone_ring = $phone_ring
@onready var phone_button = $phone

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timeout() -> void:
	phone_ring.play()
	phone_button.disabled = false
