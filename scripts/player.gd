extends CharacterBody2D
## Player da revisao. Os controles ja funcionam (nao e tarefa aqui).

const SPEED: float = 300.0
const JUMP_VELOCITY: float = -420.0
const SUPER_JUMP_VELOCITY: float = -680.0
const DASH_SPEED: float = 800.0
const DASH_TIME: float = 0.65

var pode_dash: bool = false
var dash_timer: float = 0.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if dash_timer <= 0.0 and not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# TAREFA (cena 04): o super pulo so funciona com a tecla "super_pulo"
	# mapeada E com a animacao "pular" criada no AnimatedSprite2D.
	# So funciona na cena da fase 4 -- o desafio dela e so ali; nas outras
	# fases a tecla/animacao continuam existindo, mas nao dao super pulo.
	if Input.is_action_just_pressed("super_pulo") and is_on_floor() \
			and sprite.sprite_frames.has_animation("pular") \
			and get_tree().current_scene.get("indice") == 4:
		velocity.y = SUPER_JUMP_VELOCITY

	if pode_dash and Input.is_action_just_pressed("dash"):
		dash_timer = DASH_TIME
		velocity.y = 0.0
		velocity.x = DASH_SPEED * (-1.0 if sprite.flip_h else 1.0)

	if dash_timer > 0.0:
		dash_timer -= delta
	else:
		var direction: float = Input.get_axis("move_left", "move_right")
		if direction != 0.0:
			velocity.x = direction * SPEED
			sprite.flip_h = direction < 0.0
		else:
			velocity.x = move_toward(velocity.x, 0.0, SPEED)

	move_and_slide()

	if not is_on_floor() and sprite.sprite_frames.has_animation("pular"):
		sprite.play("pular")
	elif is_on_floor():
		sprite.play("idle")


func ativar_dash() -> void:
	pode_dash = true
