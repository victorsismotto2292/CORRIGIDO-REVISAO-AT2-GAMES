extends StaticBody2D
## Portao que sobe (sai da frente) tocando uma animacao.

# TAREFA: falta criar a variavel que guarda a referencia do AnimationPlayer
# (algo como "@onready var nome: AnimationPlayer = $AnimationPlayer") e usar
# o metodo play() dela dentro de acionar(), tocando a animacao "abrir".

@onready var animação: AnimationPlayer = $AnimationPlayer


func acionar(_body: Node2D = null) -> void:
	pass
	animação.play("abrir")
