extends StaticBody2D

@export var jogador1 : bool
@export var bola : Node2D
var velocidade_do_jogador : int = 500

var tempo_reacao := 0.2
var tempo_passado := 0.0
var alvo_y := 0.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if jogador1:
		movimentar_jogador1(delta)
	else:	
		movimentar_jogador2_aleatorio(delta)
	
	limitar_movimento_do_jogador()

func movimentar_jogador1(delta : float) -> void:
	if jogador1:
		if Input.is_action_pressed("mv-cima-1"):
			position.y -= velocidade_do_jogador * delta
		elif Input.is_action_pressed("mv-baixo-1"):
			position.y += velocidade_do_jogador * delta

func movimentar_jogador2_aleatorio(delta : float) ->void:
	if bola == null:
		return
	
	tempo_passado += delta
	
	if tempo_passado >= tempo_reacao:
		alvo_y = bola.position.y
		tempo_passado = 0.0
	
	if position.y < alvo_y:
		position.y += velocidade_do_jogador * delta
	elif position.y > alvo_y:
		position.y -= velocidade_do_jogador * delta
		
func limitar_movimento_do_jogador() -> void:
	position.y = clamp(position.y, 64, 654)
				
