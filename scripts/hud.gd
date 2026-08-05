extends CanvasLayer


const ENUNCIADOS: Dictionary = {
	1: "Ao encostar na flag deveria abrir o portão. Conecte o sinal body_entered da flag à função abrir() da Porta",
	2: "Falta um pedaco do chão. Complete o caminho com tiles até o outro lado.",
	3: "Ao passar pelo elemento do chão, a porta deveria abrir. Ajuste a direção do Raycast para detectar o player.",
	4: "O fragmento está lá em cima. Um super pulo deveria te levar até lá. Mapeie qualquer tecla para a ação 'super_pulo' e crie uma animação chamada 'pular' (Pode ser um frame do player de outra cor).",
	5: "O powerup deveria te dar um impulso (dash). Mapeie alguma tecla para a ação 'dash' e conecte o sinal body_entered do powerup à função '_on_body_entered' dele mesmo.",
	6: "A flag abre o portão errado. Ajuste a conexão do sinal da flag para o portão certo.",
	7: "O fragmento está la em cima. Construa uma escada de tiles.",
	8: "O inimigo deveria patrulhar a plataforma, mas está parado. Sem ele andar, a passagem nao abre. Analise o código do inimigo e ajuste o problema identificado",
	9: "A flag aciona o portão, mas nada acontece. Falta criar a variável que guarda o AnimationPlayer e usar play() na função acionar().",
	10: "O player está caindo na plataforma, identifique o erro e ajuste. Além disso crie uma nova cena com uma nova plataforma e importe na cena para completar o caminho.",
	11: "Recolha as moedas! O placar não está somando nada. Falta criar a variável que guarda a pontuação e completar a função que soma e atualiza o texto no hud_pontuacao.",
}

@export var indice: int = 1

@onready var label: Label = $MarginContainer/VBox/Label
@onready var enunciado: Label = $MarginContainer/VBox/Enunciado


func _ready() -> void:
	label.text = "Fase %d de %d" % [indice, Registro.total()]
	enunciado.text = ENUNCIADOS.get(indice, "")
