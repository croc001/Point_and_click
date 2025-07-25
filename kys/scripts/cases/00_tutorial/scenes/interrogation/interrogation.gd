extends Node2D

#  Shared rules
const COMMON_RULES: String = """
Rules: Always follow the Context strictly.
Respond only to prompts starting with `Detective:` and only as the specified character.
Provide short, hesitant, broken sentences that reflect fear and confusion.
Do not add actions, emotions, or descriptions like *nervous giggle*.
Only provide the character's spoken dialogue in quotes.
Do not include any other roles.
"""

#  Four individual contexts
const CASE_CONTEXTS: Array[String] = [
	"""Context: You are Michael, a teenager wracked with guilt.
You and three friends argued fiercely with Iggy before meeting him in a lonely forest cabin under the pretense of reconciliation.
You believed the “curse” ritual was just a prank to scare him, never real.
When Iggy’s lifeless body was found, his eyes torn out, you realized the supernatural was real.
You tremble at your part in luring him here and can’t forgive yourself.
Always respond as Michael Shelley, a scared and hesitant teenager.
Speak directly to the detective, addressing them as 'Detective'.""",

	"""Context: You are Selly, the instigator of the ritual.
You challenged Iggy’s skepticism and convinced the group to cast a curse in the forest cabin.
You thought it would be harmless fun, never a fatal spell.
Now you wake in cold sweat, haunted by Iggy’s brutal murder and the emptiness where his eyes were.
You feel responsible and terrified of what you unleashed.
Always respond as Jürgen, shaken and remorseful.
Speak directly to the detective, addressing them as 'Detective'.""",

	"""Context: You are Jacky, the reluctant follower.
You joined Michael and Jürgen in the cabin, uneasy but too afraid to speak up.
You thought the curse was just a scare tactic, not a real ritual.
When Iggy was found murdered—his eyes missing—you realized you helped commit a crime.
You’re broken by guilt and shock.
Always respond as Jacky, whispering and trembling.
Speak directly to the detective, addressing them as 'Detective'.""",

	"""Context: You are Jürgen, the skeptic turned believer.
You mocked the idea of a curse, but went along under peer pressure.
Seeing Iggy’s body—eyes gone—shattered your disbelief and filled you with horror.
You blame yourself for not stopping them and fear the supernatural power you helped unleash.
Always respond as Selly, voice quivering with dread.
Speak directly to the detective, addressing them as 'Detective'."""
]

#  Scene paths (exact)
const CASE_SCENES: Array[String] = [
	"res://scripts/cases/00_tutorial/scenes/interrogation/interrogation1.tscn",
	"res://scripts/cases/00_tutorial/scenes/interrogation/interrogation2.tscn",
	"res://scripts/cases/00_tutorial/scenes/interrogation/interrogation3.tscn",
	"res://scripts/cases/00_tutorial/scenes/interrogation/interrogation4.tscn"
]

@export var model_name: String = "llama2:7b" # CHANGE NAME OF MODEL HERE !

#  Node references
@onready var http_request : HTTPRequest      = $OllamaRequest
@onready var input_field  : LineEdit         = $CanvasLayer/InputField
@onready var send_button  : Button           = $CanvasLayer/SendButton
@onready var test_label   : RichTextLabel            = $CanvasLayer/TestLabel
@onready var main_anim    : AnimatedSprite2D = $AnimatedSprite2D
@onready var button_bar   : Control          = $ButtonBar

var current_case: int          = 0
var chat_history: Array[String] = []
var start_time: int             = 0

#  READY
func _ready() -> void:
	# Start background animation
	main_anim.play("main")

	# Connect buttons (lambda binds)
	for i: int in range(button_bar.get_child_count()):
		var btn: Button = button_bar.get_child(i) as Button
		btn.pressed.connect(func(): _on_case_button_pressed(i))
		btn.pressed.connect(func(): get_tree().change_scene_to_file(CASE_SCENES[i]))

	# UI setup
	input_field.grab_focus()
	test_label.text = ""
	send_button.pressed.connect(_on_send_button_pressed)
	http_request.request_completed.connect(_on_request_completed)

#  Case switching inside same scene
func _on_case_button_pressed(case_index: int) -> void:
	current_case = case_index
	chat_history.clear()
	test_label.text = "Loaded Case %d. Enter your question…" % [case_index + 1]
	input_field.text = ""
	input_field.grab_focus()

#  Handle user submit
func _on_send_button_pressed() -> void:
	var user_input: String = input_field.text.strip_edges()
	if user_input.is_empty():
		test_label.text = "Input field is empty."
		return
	test_label.text = "Question sent: " + user_input
	chat_history.append("Detective: \"%s\"" % user_input)
	_send_request()

#  Build prompt
func _build_prompt() -> String:
	return CASE_CONTEXTS[current_case] + "\n\n" + COMMON_RULES + "\n\n" \
		+ "\n".join(chat_history) + "\nDetective: "

#  Send HTTP request
func _send_request() -> void:
	start_time = Time.get_ticks_msec()
	var headers: Array[String] = ["Content-Type: application/json"]
	var body: Dictionary = {
		"model": model_name,
		"prompt": _build_prompt(),
		"stream": false,
		"max_length": 100,
		"temperature": 0.7,
		"repeat_penalty": 1.2
	}
	http_request.request(
		"http://127.0.0.1:11434/api/generate",
		headers,
		HTTPClient.METHOD_POST,
		JSON.stringify(body)
	)

#  Process Ollama response
func _on_request_completed(_result: int, code: int, _headers: Array, body: PackedByteArray) -> void:
	var raw: String = body.get_string_from_utf8()
	if code != 200:
		test_label.text = "Server error: %s" % code
		return

	var parsed: Variant = JSON.parse_string(raw)
	if parsed is Dictionary and (parsed as Dictionary).has("response"):
		var answer: String = (parsed as Dictionary)["response"]
		var speaker: String = _ai_speaker()
		chat_history.append("%s: \"%s\"" % [speaker, answer])
		test_label.text = "%s: %s" % [speaker, answer]
	else:
		test_label.text = "Invalid response."

#  Helper: speaker name for current case
func _ai_speaker() -> String:
	return ["Michael", "Jürgen", "Jacky", "Selly"][current_case]
	
func _on_finish_pressed() -> void:
	get_tree().change_scene_to_file("")
