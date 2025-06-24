# res://scripts/common/SaveManager.gd
# Central singleton handling all save/load I/O under user://,
# with auto-incrementing slot names

extends Node

const SAVE_DIR    : String = "user://"
const SAVE_EXT    : String = ".save"
const SLOT_PREFIX : String = "save_slot"

# Holds whatever you need to persist; add more keys as your game grows.
var save_data: Dictionary = {
	"scene": "",
	"phone_answered": false
}

func _ready() -> void:
	# Ensure the user:// directory exists
	DirAccess.open(SAVE_DIR)

# Returns "save_slot1.save", "save_slot2.save", … automatically
func _get_next_slot_name() -> String:
	var max_idx: int = 0
	var slots: Array = get_save_list()
	var regex: RegEx = RegEx.new()
	regex.compile("^%s(\\d+)%s$" % [SLOT_PREFIX, SAVE_EXT])
	for fname in slots:
		var m: RegExMatch = regex.search(fname)
		if m:
			var idx: int = int(m.get_string(1))
			max_idx = max(max_idx, idx)
	return "%s%d%s" % [SLOT_PREFIX, max_idx + 1, SAVE_EXT]

# Saves into the given slot, or auto-increments if none passed
func save_game(slot_name: String = "") -> void:
	if slot_name == "":
		slot_name = _get_next_slot_name()

	# 1) Record current scene path
	save_data["scene"] = get_tree().current_scene.scene_file_path
	# 2) Record any global flags
	#save_data["phone_answered"] = GlobalVar.phone_is_answered

	# 3) Serialize to JSON
	var json_str: String = JSON.stringify(save_data)

	# 4) Write to disk
	var path: String = SAVE_DIR + slot_name
	var file: FileAccess = FileAccess.open(path, FileAccess.WRITE)
	if file:
		file.store_string(json_str)
		file.close()
		print("SaveManager: saved to ", path)
	else:
		push_error("SaveManager: could not write to %s" % path)

# Loads from the given slot, or slot1 by default
func load_game(slot_name: String = "") -> void:
	if slot_name == "":
		slot_name = "%s1%s" % [SLOT_PREFIX, SAVE_EXT]

	var path: String = SAVE_DIR + slot_name
	if not FileAccess.file_exists(path):
		push_warning("SaveManager: no save file %s found." % slot_name)
		return

	var file: FileAccess = FileAccess.open(path, FileAccess.READ)
	if not file:
		push_error("SaveManager: could not open %s" % path)
		return
	var content: String = file.get_as_text()
	file.close()

	# 5) Parse JSON via instance API
	var parser: JSON = JSON.new()
	var err: int = parser.parse(content)
	if err != OK:
		push_error("SaveManager: JSON parse error – %s" % parser.get_error_message())
		return
	# 6) Typed access to parsed Dictionary
	var data: Dictionary = parser.data

	# 7) Restore scene
	if data.has("scene") and data["scene"] != "":
		get_tree().change_scene_to_file(data["scene"])

	# 8) Restore flags
	if data.has("phone_answered"):
		GlobalVar.phone_is_answered = data["phone_answered"]

	print("SaveManager: loaded from ", path)

# Returns a list of all "*.save" filenames in user://
func get_save_list() -> Array:
	var dir: DirAccess = DirAccess.open(SAVE_DIR)
	var slots: Array = []
	if dir:
		dir.list_dir_begin()
		var fname: String = dir.get_next()
		while fname != "":
			if not dir.current_is_dir() and fname.ends_with(SAVE_EXT):
				slots.append(fname)
			fname = dir.get_next()
		dir.list_dir_end()
	return slots
