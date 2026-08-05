extends Node
## Fica de olho na pontuacao da fase 11 e abre a porta quando o codigo do
## placar (scripts/hud_pontuacao.gd) estiver funcionando de verdade.
##
## Nao basta "pontuacao" existir e ser positiva -- isso um aluno engana so
## declarando "var pontuacao: int = 1" sem nunca completar somar_ponto().
## Por isso exige as DUAS coisas, vindas de fontes que o aluno nao edita
## (moeda.gd): (a) pelo menos uma moeda foi realmente tocada pelo player
## (sinal "coletada"); (b) o valor de "pontuacao" aumentou em relacao ao que
## era no _ready() -- um valor fixo declarado na variavel nunca aumenta
## sozinho, só quem escreve e chama a soma de verdade consegue.

@export var hud_path: NodePath
@export var porta_path: NodePath

@onready var hud: Node = get_node(hud_path)
@onready var porta: Node = get_node(porta_path)

var aberta: bool = false
var pontuacao_inicial: Variant = null
var moedas_coletadas: int = 0


func _ready() -> void:
	pontuacao_inicial = hud.get("pontuacao")
	for irmao in get_parent().get_children():
		if irmao.is_in_group("moeda"):
			irmao.coletada.connect(_on_moeda_coletada)


func _on_moeda_coletada() -> void:
	moedas_coletadas += 1


func _process(_delta: float) -> void:
	if aberta:
		return
	if moedas_coletadas <= 0:
		return
	var pontos: Variant = hud.get("pontuacao")
	if typeof(pontos) != TYPE_INT or typeof(pontuacao_inicial) != TYPE_INT:
		return
	if pontos > pontuacao_inicial:
		aberta = true
		porta.abrir()
