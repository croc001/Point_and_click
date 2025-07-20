extends Node

var phone_is_answered = false
var investigator_dialogue_is_over := false
var IcyGiovanni_dialogue_is_over = false
var teacher_dialogue_is_over = false
var phone_collected := false
var map_unlocked := false
var school_evidence_done := false
var icecream_evidence_done := false

func can_access_school() -> bool:
	return true

func can_access_icecream() -> bool:
	return school_evidence_done

func can_access_forest() -> bool:
	return school_evidence_done and icecream_evidence_done
