extends Node

func _ready():
	UIManager.show_ui("res://ui/main_menu.tscn")
	SceneManager.load_game_scene()
