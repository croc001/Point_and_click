extends Control

@onready var antwort_felder := [
	$"hinweisliste/antwort 1",
	$"hinweisliste/antwort 2",
	$"hinweisliste/antwort 3"
]
@onready var feedback_label := $"../feedbacklabel"
@onready var hinweis_liste := $hinweisliste
@onready var check_button := $"../checkbutton"


var richtige_antworten = ["male", "Iggy Welst", "a week"]

func _ready():
	_lade_hinweise()

func _lade_hinweise():
	var hinweise = [
		preload("res://assets/global/Evidenceboard/aweek.tres"),
		preload("res://assets/global/Evidenceboard/detective.tres"),
		preload("res://assets/global/Evidenceboard/female.tres"),
		preload("res://assets/global/Evidenceboard/Iggy.tres"),
		preload("res://assets/global/Evidenceboard/male.tres")
	]
	for hinweis in hinweise:
		var btn = Button.new()
		btn.text = hinweis.text
		btn.pressed.connect(_on_hinweis_ausgewaehlt.bind(hinweis.id))
		hinweis_liste.add_child(btn)

func _on_hinweis_ausgewaehlt(hinweis_id: String):
	# Füllt das erste freie Antwortfeld
	for feld in antwort_felder:
		if feld.text == "":
			feld.text = hinweis_id
			return

func _on_checkbutton_pressed():
	print("asdadadadada")
	var eingaben = []
	for feld in antwort_felder:
		eingaben.append(feld.text.strip_edges().to_lower())

	if eingaben == richtige_antworten:
		feedback_label.text = "Richtig kombiniert!"
	else:
		feedback_label.text = "Falsch – versuch's nochmal."
