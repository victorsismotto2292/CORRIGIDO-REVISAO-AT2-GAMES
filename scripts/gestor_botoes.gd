extends Node2D
## Cena 10: dois botoes precisam estar acionados para o portao abrir.

var _b1: bool = false
var _b2: bool = false

@export var porta: NodePath


func botao1(_body: Node2D = null) -> void:
	_b1 = true
	_conferir()


func botao2(_body: Node2D = null) -> void:
	_b2 = true
	_conferir()


func _conferir() -> void:
	if _b1 and _b2:
		var p: Node = get_node_or_null(porta)
		if p:
			p.abrir()
