extends Node

func load_game_scene() -> void:
	get_tree().change_scene_to_file("res://world/world.tscn")
	UIManager.show_ui("res://ui/game_ui.tscn")
	 
func return_to_main_menu() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	UIManager.show_ui("res://ui/main_menu.tscn")
