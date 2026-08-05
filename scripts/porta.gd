extends StaticBody2D

func abrir(_body: Node2D = null) -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	visible = false
