extends Area2D
## Moeda de pontuacao (fase 11). Ao tocar o player, avisa o HUD de
## pontuacao pra somar 1 ponto.

signal coletada

@export var hud_path: NodePath

@onready var hud: Node = get_node(hud_path)


func _ready() -> void:
	add_to_group("moeda")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		hud.somar_ponto()
		coletada.emit()
		queue_free()
