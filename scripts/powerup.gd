extends Area2D
## PowerUp que da a habilidade de dash ao player.

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.ativar_dash()
		queue_free()
