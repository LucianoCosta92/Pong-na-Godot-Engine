extends StaticBody2D

@export var jogador1 : bool
@export var bola : Node2D
var velocidade_humano : int = 600
var velocidade_do_jogador : int = 600
var margem_de_erro : float = 0.0

var tempo_reacao := 0.2
var tempo_passado := 0.0
var alvo_y := 0.0

var dificuldade_aplicada := false

func _ready() -> void:
	print("Jogador pronto! Jogador1 = ", jogador1)
	

func _process(delta: float) -> void:
	if not jogador1 and not dificuldade_aplicada:
		seleciona_dificuldade()
		dificuldade_aplicada = true
	if jogador1:
		movimentar_jogador1(delta)
	else:	
		movimentar_jogador2_aleatorio(delta)
	
	limitar_movimento_do_jogador()

func movimentar_jogador1(delta : float) -> void:
	if jogador1:
		if Input.is_action_pressed("mv-cima-1"):
			position.y -= velocidade_humano * delta
		elif Input.is_action_pressed("mv-baixo-1"):
			position.y += velocidade_humano * delta

func movimentar_jogador2_aleatorio(delta : float) ->void:
	if bola == null:
		return
	
	tempo_passado += delta
	
	if tempo_passado >= tempo_reacao:
		var desvio = randf_range(-margem_de_erro, margem_de_erro)
		
		alvo_y = bola.position.y + desvio
		tempo_passado = 0.0
	
	if position.y < alvo_y:
		position.y += velocidade_do_jogador * delta
	elif position.y > alvo_y:
		position.y -= velocidade_do_jogador * delta
		
func limitar_movimento_do_jogador() -> void:
	position.y = clamp(position.y, 64, 654)

func seleciona_dificuldade() -> void:
	print("Selecionado dificuldade: ", Global.dificuldade)
	match Global.dificuldade:
		"facil":
			velocidade_do_jogador = 350
			tempo_reacao = 0.7
			margem_de_erro = 100.0
		"medio":
			velocidade_do_jogador = 500
			tempo_reacao = 0.10
			margem_de_erro = 40.0
		"dificil":
			velocidade_do_jogador = 800
			tempo_reacao = 0.01
			margem_de_erro = 5.0
	print("Velocidade: ", velocidade_do_jogador, " | Reação: ", tempo_reacao)
