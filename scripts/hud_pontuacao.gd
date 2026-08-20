extends CanvasLayer
## Placar da fase 11. Ainda nao funciona: falta criar a variavel que guarda
## a pontuacao e completar a funcao que soma e atualiza o texto.

@onready var label_pontos: Label = $MarginContainer/VBox/Pontos

var pontuacao: int = 0


func somar_ponto() -> void:
	pontuacao += 1
	label_pontos.text = "Pontos: " + str(pontuacao) 
	pass
