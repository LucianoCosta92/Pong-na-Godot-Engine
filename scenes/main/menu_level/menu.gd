extends Control

func _ready() -> void:
	$VBoxContainer/Facil.pressed.connect(_on_easy_pressed)
	$VBoxContainer/Medio.pressed.connect(_on_medium_pressed)
	$VBoxContainer/Dificil.pressed.connect(_on_hard_pressed)
	$VBoxContainer/Voltar.pressed.connect(_on_back_pressed)
	

func _process(delta: float) -> void:
	pass


func _on_easy_pressed():
	Global.dificuldade = "facil"
	load_game()


func _on_medium_pressed():
	Global.dificuldade = "medio"
	load_game()


func _on_hard_pressed():
	Global.dificuldade = "dificil"
	load_game()
	

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main/main_menu.tscn")
	
	
func load_game() -> void:
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")
