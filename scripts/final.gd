extends Control
## Tela final. So chega aqui quem passou por todas as fases em ordem.

@onready var info: Label = $Center/VBox/Info


func _ready() -> void:
	info.text = "Voce completou %d de %d fases!" % [Registro.feitas(), Registro.total()]
