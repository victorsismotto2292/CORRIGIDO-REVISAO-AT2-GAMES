extends Area2D


const POSICOES: Dictionary = {
	1: Vector2(937, 408),
	2: Vector2(1184, 408),
	3: Vector2(1250, 408),
	4: Vector2(950, 240),
	5: Vector2(1300, 408),
	6: Vector2(1250, 408),
	7: Vector2(1408, 152),
	8: Vector2(1250, 408),
	9: Vector2(1250, 408),
	10: Vector2(1650, 408),
	11: Vector2(1700, 408),
}

@export var indice: int = 1


func _ready() -> void:
	if POSICOES.has(indice):
		global_position = POSICOES[indice]


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Registro.concluir(indice)
