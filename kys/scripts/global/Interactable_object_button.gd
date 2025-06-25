# HoverButton.gd
extends Button
class_name Interactable_object_button
"""
DO NOT USE DIRECTLY AS LINKED SCRIPT!
A Button that Swithces the Curoser when Hovered
"""


@onready var cursor = Cursor 
@export var cursor_hover_state: String = "cursor_eye" # <-- Custom Cursor-Animation

func _ready():
	connect("mouse_entered", Callable(self, "_on_hover_start"))
	connect("mouse_exited", Callable(self, "_on_hover_end"))

func _on_mouse_entered():
	cursor.set_cursor_state(cursor_hover_state)
	

func _on_mouse_exited():
	cursor.set_cursor_state("idle")
