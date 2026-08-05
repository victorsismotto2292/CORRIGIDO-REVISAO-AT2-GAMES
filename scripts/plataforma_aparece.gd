extends StaticBody2D

func _ready() -> void:
	visible = false
	$CollisionShape2D.set_deferred("disabled", true)


func aparecer(_body: Node2D = null) -> void:
	visible = true
	$CollisionShape2D.set_deferred("disabled", false)


func nada(_body: Node2D = null) -> void:
	pass
