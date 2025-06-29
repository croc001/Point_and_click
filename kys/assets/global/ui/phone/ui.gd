extends CanvasLayer

var menu_open := false
var is_animating := false
var phone_start_pos := Vector2()
var phone_offset_y := -135
var map_overlay: Node = null
var evidence_board: Node = null

func _ready():
	visible = true #das macht das das gesamte handy angezeigt wird oder nicht
	phone_start_pos = $Control/PhonePanel.position
	$Control/PhonePanel/MAP_APP.pressed.connect(_on_map_app_pressed)
	$Control/PhonePanel/EVIDENCE_APP.pressed.connect(_on_evidence_app_pressed)
	$Control/PhonePanel/INVENTORY_APP.pressed.connect(_on_inventory_app_pressed)
	$Control/PhonePanel/QUESTLOG_APP.pressed.connect(_on_questlog_app_pressed)
	#von hier bis
	
func _on_map_app_pressed():
	if map_overlay == null:
		var scene = preload("res://assets/global/ui/map/MapOverlay.tscn")
		map_overlay = scene.instantiate()
		get_tree().current_scene.add_child(map_overlay)  # adds to the root of current scene
	else:
		map_overlay.visible = not map_overlay.visible

func _on_evidence_app_pressed():
	if evidence_board == null:
		var scene = preload("res://assets/global/Evidenceboard/Evidenceboard.tscn")
		evidence_board = scene.instantiate()

		# Access the Control node where case_data exists
		var control_node = evidence_board.get_node("Control")
		control_node.case_data = preload("res://assets/global/Evidenceboard/resources/Office_Evidence.tres")

		get_tree().current_scene.add_child(evidence_board)
		control_node.show()  # Show the evidence board (the Control node)
	else:
		var control_node = evidence_board.get_node("Control")
		control_node.visible = not control_node.visible

func _on_inventory_app_pressed():
	print("Inventory geöffnet")

func _on_questlog_app_pressed():
	print("Questlog geöffnet")
	#hier ist nur zum testen ob die buttons funktionieren

func _open_phone():
	if is_animating or menu_open:
		return
	is_animating = true
	var tween = get_tree().create_tween()
	var panel = $Control/PhonePanel
	tween.tween_property(panel, "position", phone_start_pos + Vector2(0, phone_offset_y), 0.4)
	tween.tween_callback(Callable(self, "_on_tween_opened"))

	# APPS sichtbar machen
	panel.get_node("MAP_APP").visible = true
	panel.get_node("EVIDENCE_APP").visible = true
	panel.get_node("INVENTORY_APP").visible = true
	panel.get_node("QUESTLOG_APP").visible = true

func _close_phone():
	if is_animating or not menu_open:
		return
	is_animating = true
	var tween = get_tree().create_tween()
	var panel = $Control/PhonePanel
	tween.tween_property(panel, "position", phone_start_pos, 0.4)
	tween.tween_callback(Callable(self, "_on_tween_closed"))

	# APPS unsichtbar machen
	panel.get_node("MAP_APP").visible = false
	panel.get_node("EVIDENCE_APP").visible = false
	panel.get_node("INVENTORY_APP").visible = false
	panel.get_node("QUESTLOG_APP").visible = false

func _on_tween_opened():
	menu_open = true
	is_animating = false

func _on_tween_closed():
	menu_open = false
	is_animating = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and not menu_open:
			_open_phone()
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and menu_open:
			_close_phone()
