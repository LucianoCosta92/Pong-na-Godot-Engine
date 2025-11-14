extends Control

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	menu_level()
	
func _on_exit_pressed() -> void:
	get_tree().quit()
	
func menu_level() ->void:
	get_tree().change_scene_to_file("res://scenes/main/menu_level/menu.tscn")
