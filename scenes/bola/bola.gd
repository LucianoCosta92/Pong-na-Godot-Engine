extends Area2D

var velocidade_da_bola : int = 500
var posicao_inicial : Vector2 = Vector2(640,360) # x / y -> coordenadas
var direcao_inicial : Vector2 = Vector2(0,0) 
var nova_direcao : Vector2 = Vector2(0,0)

func _ready() -> void:
	resetar_bola()

func _process(delta: float) -> void:
	movimentar_bola(delta)

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
	
	
	
	
