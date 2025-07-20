extends Control

@export var case_data: CaseResource

@onready var hint_list := $hintList
@onready var text_gap_container := $hintList/TextGapContainer
@onready var feedback_label := $feedbackLabel
@onready var check_button := $checkButton
@onready var hint_button_container := $hintList/HintButtons

var answer_fields: Array[LineEdit] = []
var current_case: CaseResource = null

func _ready():
	hide()  # Hidden by default
	DetectivePhone.visible = false
	check_button.pressed.connect(_on_check_button_pressed)

func load_case(new_case: CaseResource):
	reset_board()
	current_case = new_case
	_build_case(current_case)
	show()

func reset_board():
	answer_fields.clear()

	for child in text_gap_container.get_children():
		child.queue_free()

	for child in hint_button_container.get_children():
		child.queue_free()

	feedback_label.text = ""
	current_case = null

func _build_case(case: CaseResource):
	for part in case.text_template:
		if part == "_":
			var field = LineEdit.new()
			field.custom_minimum_size = Vector2(120, 0)
			answer_fields.append(field)
			text_gap_container.add_child(field)
		else:
			var label = Label.new()
			label.text = part
			text_gap_container.add_child(label)

	for hint in case.hints:
		var btn = Button.new()
		btn.text = hint["text"]
		btn.pressed.connect(func(): _on_hint_selected(hint["id"]))
		hint_button_container.add_child(btn)

func _on_hint_selected(hint_id: String):
	for field in answer_fields:
		if field.text == "":
			field.text = hint_id
			return

func _on_check_button_pressed():
	var inputs = []
	for field in answer_fields:
		inputs.append(field.text.strip_edges())

	if inputs == current_case.correct_answers:
		feedback_label.text = "Correct combination!"
		GlobalVar.map_unlocked = true
		print("🗺️ Map wurde freigeschaltet!")
		await get_tree().create_timer(2.0).timeout
		reset_board()
		hide()
	else:
		feedback_label.text = "Incorrect – try again."
