extends Node

@onready var ui_root: Control = get_tree().root.get_node("Main/UIRoot")
var current_ui: Control = null

func show_ui(scene_path: String) -> void:
	if current_ui:
		current_ui.queue_free()
	var ui_scene := load(scene_path)
	if ui_scene:
		current_ui = ui_scene.instantiate()
		ui_root.add_child(current_ui)
	else:
		push_error("Failed to load UI scene: %s" % scene_path)
