extends Node

var basic = preload("res://assets/global/cursor/cursor_basic.png")
var eye   = preload("res://assets/global/cursor/cursor_eye.png")

func set_basic(): Input.set_custom_mouse_cursor(basic)
func set_eye():   Input.set_custom_mouse_cursor(eye)
