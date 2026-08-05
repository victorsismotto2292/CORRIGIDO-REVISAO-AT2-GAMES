extends Area2D
## So deve reagir ao Inimigo passando por cima -- ignora o player, senao ele
## abriria a porta so pulando direto no sensor, sem precisar do inimigo andar.

signal pisado


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		pisado.emit()
