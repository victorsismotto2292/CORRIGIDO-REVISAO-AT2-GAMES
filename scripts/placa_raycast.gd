extends Node2D
## Placa de pressao: usa um RayCast2D para "sentir" o player em cima
## e abrir o portao ligado em "alvo".

@export var alvo: NodePath

@onready var ray: RayCast2D = $RayCast2D


func _physics_process(_delta: float) -> void:
	if ray.is_colliding():
		var corpo: Object = ray.get_collider()
		if corpo and corpo.is_in_group("player"):
			var porta: Node = get_node_or_null(alvo)
			if porta:
				porta.abrir()
