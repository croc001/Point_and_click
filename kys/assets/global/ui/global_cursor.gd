extends CanvasLayer

@onready var animated_cursor = $AnimatedCursor
@onready var inventory: Inventory

var hovered_item: Node = null

func _ready() -> void:
	animated_cursor.hide()

func show_cursor_spinning():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if animated_cursor and animated_cursor.sprite_frames and animated_cursor.sprite_frames.has_animation("cursor_spinning"):
		animated_cursor.global_position = get_viewport().get_mouse_position()
		animated_cursor.show()
		animated_cursor.play("cursor_spinning")
	else:
		print("GlobalCursor.gd: 'cursor_spinning' nicht gefunden oder kein AnimatedSprite2D vorhanden!")

func hide_cursor():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if animated_cursor:
		animated_cursor.stop()
		animated_cursor.hide()

func _process(delta: float) -> void:
	if animated_cursor and animated_cursor.visible:
		animated_cursor.global_position = get_viewport().get_mouse_position()

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_viewport().get_mouse_position()
		var space_state = get_viewport().get_world_2d().direct_space_state

		var query = PhysicsPointQueryParameters2D.new()
		query.position = mouse_pos
		query.collide_with_areas = true
		query.collide_with_bodies = false

		var result = space_state.intersect_point(query, 1)

		if result.size() > 0:
			var area = result[0].get("collider")
			if area and area.has_method("collect"):
				area.collect(inventory)

#Methode wird von Items aufgerufen
func register_hover_item(item: Node) -> void:
	hovered_item = item
	Input.set_custom_mouse_cursor(
		load("res://assets/global/cursor/cursor_eye.png"),
		Input.CursorShape.CURSOR_POINTING_HAND
	)

func unregister_hover_item(item: Node) -> void:
	if hovered_item == item:
		hovered_item = null
		Input.set_custom_mouse_cursor(null, Input.CursorShape.CURSOR_ARROW)
