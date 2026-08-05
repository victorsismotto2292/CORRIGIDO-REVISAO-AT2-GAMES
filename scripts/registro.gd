extends Node

var _ordem: Array[String] = [
	"res://cenas/cena01.tscn",
	"res://cenas/cena02.tscn",
	"res://cenas/cena03.tscn",
	"res://cenas/cena04.tscn",
	"res://cenas/cena05.tscn",
	"res://cenas/cena06.tscn",
	"res://cenas/cena07.tscn",
	"res://cenas/cena08.tscn",
	"res://cenas/cena09.tscn",
	"res://cenas/cena10.tscn",
	"res://cenas/cena11.tscn",
	"res://cenas/final.tscn",
]

var _feitas: Array[int] = []
var _chk: int = 0
var desbloqueado: bool = true 


func total() -> int:
	return _ordem.size() - 1


func feitas() -> int:
	return _feitas.size()


func iniciar() -> void:
	_feitas.clear()
	_chk = 0
	_trocar(_ordem[0])


func concluir(indice: int) -> void:
	if not _feitas.has(indice):
		_feitas.append(indice)
		_chk = _chk * 31 + indice
	if indice >= 0 and indice < _ordem.size():
		_trocar(_ordem[indice])


func _trocar(caminho: String) -> void:
	get_tree().call_deferred("change_scene_to_file", caminho)


func validar(indice: int) -> void:
	if _feitas.size() < indice - 1:
		iniciar()
