extends Node2D

@onready var bola : Area2D = $"../Bola"

var pontuacao_jogador1 : int = 0
var pontuacao_jogador2 : int = 0

@onready var texto_pontuacao_jogador1 : Label = $"../UI/PainelDePontuacao/TextoPontuacaoJogador1"
@onready var texto_pontuacao_jogador2 : Label = $"../UI/PainelDePontuacao/TextoPontuacaoJogador2"

@onready var som_impacto_gol : AudioStreamPlayer = $SomImpactoGol

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	receber_inputs()

func receber_inputs() -> void:
	if Input.is_action_just_pressed("reiniciar"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("sair"):
		get_tree().quit()

func _on_gol_1_area_entered(area: Area2D) -> void:
	som_impacto_gol.play()
	pontuacao_jogador2 += 1
	texto_pontuacao_jogador2.text = str(pontuacao_jogador2)
	bola.rodar_timer()


func _on_gol_2_area_entered(area: Area2D) -> void:
	som_impacto_gol.play()
	pontuacao_jogador1 += 1
	texto_pontuacao_jogador1.text = str(pontuacao_jogador1)
	bola.rodar_timer()
	
