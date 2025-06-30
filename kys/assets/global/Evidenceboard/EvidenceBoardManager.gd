# EvidenceBoardManager.gd
extends Node

var evidence_board_scene = preload("res://assets/global/Evidenceboard/Evidenceboard.tscn")
var evidence_board = null

func show_board(case_resource: Resource):
	if evidence_board == null or not is_instance_valid(evidence_board):
		evidence_board = evidence_board_scene.instantiate()
		get_tree().root.add_child(evidence_board)

	var control_node = evidence_board.get_node("Control")
	control_node.load_case(case_resource)
	evidence_board.show()

func toggle_board(case_resource: Resource):
	if evidence_board == null or not is_instance_valid(evidence_board):
		show_board(case_resource)
	else:
		var control_node = evidence_board.get_node("Control")

		# Toggle visibility
		if control_node.visible:
			control_node.hide()
		else:
			control_node.load_case(case_resource)  # Always load the correct case
			control_node.show()
