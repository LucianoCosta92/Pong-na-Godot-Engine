extends Area2D

var velocidade_da_bola : int = 400
var posicao_inicial : Vector2 = Vector2(640,360) # x / y -> coordenadas (horizontal, vertical)
var direcao_inicial : Vector2 = Vector2(0,0) 
var nova_direcao : Vector2 = Vector2(0,0)

var y_minimo : float = 0 # y = vertical
var y_maximo : float = 720

@onready var timer : Timer = $Timer

func _ready() -> void:
	resetar_bola()

func _process(delta: float) -> void:
	movimentar_bola(delta)
	colidir_com_as_paredes()
	
func rodar_timer() -> void:
	timer.start()

# centraliza a bola e a manda para uma direção aleatória
func resetar_bola() -> void:
	position = posicao_inicial
	escolher_direcao_inicial()

func escolher_direcao_inicial() -> void:
	# Escolhe as direções horizontal e vertical
	var x_aleatorio = [-1, 1].pick_random()
	var y_aleatorio = [-1, 1].pick_random()
	# Aplica as novas direções
	direcao_inicial = Vector2(x_aleatorio, y_aleatorio)
	nova_direcao = direcao_inicial

func movimentar_bola(delta : float) -> void:
	position += nova_direcao * velocidade_da_bola * delta

func colidir_com_as_paredes() -> void:
	if position.y >= y_maximo or position.y <= y_minimo:
		nova_direcao.y *= -1 # inverte direção da bola ao tentar sair da tela
	# +1 * +1 = +1
	# +1 * -1 = -1
	# -1 * -1 = +1

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jogadores"):
		nova_direcao.x *= -1 # inverte direção da bola ao colidir com jogador


func _on_timer_timeout() -> void:
	resetar_bola()
	
	
