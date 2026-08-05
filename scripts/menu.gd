extends Control
## Tela inicial da Trilha.

func _on_comecar_pressed() -> void:
	Registro.iniciar()


func _on_sair_pressed() -> void:
	get_tree().quit()
