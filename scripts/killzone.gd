extends Area2D
## Se o player cair aqui, a cena reinicia (o progresso das outras fases e mantido).

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().call_deferred("reload_current_scene")
