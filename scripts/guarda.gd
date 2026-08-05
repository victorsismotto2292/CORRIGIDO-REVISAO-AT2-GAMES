extends Node2D

@export var indice: int = 1


func _ready() -> void:
	Registro.validar(indice)
