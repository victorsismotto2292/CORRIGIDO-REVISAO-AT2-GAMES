extends CharacterBody2D
## Inimigo que deveria patrulhar de um lado para o outro, virando ao
## detectar uma parede com RayCast2D.

const SPEED: float = 100.0  # BUG (cena 08): velocidade zerada, o inimigo nao anda.
const PULO_NO_INIMIGO: float = -300.0  
const RESPAWN_TEMPO: float = 1.5 

var direction: int = 1
var posicao_inicial: Vector2

@onready var ray_right: RayCast2D = $RayRight
@onready var ray_left: RayCast2D = $RayLeft
@onready var sprite: Sprite2D = $Sprite2D
@onready var colisao: CollisionShape2D = $CollisionShape2D
@onready var hitbox: Area2D = $Hitbox


func _ready() -> void:
	posicao_inicial = global_position


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if direction > 0 and ray_right.is_colliding():
		direction = -1
	elif direction < 0 and ray_left.is_colliding():
		direction = 1

	sprite.flip_h = direction < 0
	velocity.x = direction * SPEED
	move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	# Pisou em cima (o player esta bem acima e caindo): mata o inimigo.
	# Encostou pelo lado: mata o player (comportamento original).
	if body.global_position.y < global_position.y - 20.0 and body.velocity.y > 0.0:
		body.velocity.y = PULO_NO_INIMIGO
		_morrer()
	else:
		get_tree().call_deferred("reload_current_scene")


func _morrer() -> void:
	visible = false
	set_physics_process(false)
	colisao.set_deferred("disabled", true)
	hitbox.set_deferred("monitoring", false)
	velocity = Vector2.ZERO
	await get_tree().create_timer(RESPAWN_TEMPO).timeout
	global_position = posicao_inicial
	direction = 1
	colisao.set_deferred("disabled", false)
	hitbox.set_deferred("monitoring", true)
	visible = true
	set_physics_process(true)
