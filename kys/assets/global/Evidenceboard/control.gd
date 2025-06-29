extends Control

@export var case_data: CaseResource

@onready var hint_list := $hintList
@onready var text_gap_container := $hintList/TextGapContainer
@onready var feedback_label := $"../feedbackLabel"
@onready var check_button := $"../checkButton"
@onready var hint_button_container := $hintList/HintButtons

var answer_fields: Array[LineEdit] = []

func _ready():
	if case_data == null:
		push_error("No case data assigned! Please select a CaseResource in the Inspector.")
		return

	_load_case(case_data)
	check_button.pressed.connect(_on_check_button_pressed)

func _load_case(case: CaseResource):
	answer_fields.clear()

	# Properly clear the containers
	for child in text_gap_container.get_children():
		child.queue_free()

	for child in hint_button_container.get_children():
		child.queue_free()

	# Build the text with gaps
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

	# Build the hint buttons
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

	if inputs == case_data.correct_answers:
		feedback_label.text = "Correct combination!"
	else:
		feedback_label.text = "Incorrect – try again."
