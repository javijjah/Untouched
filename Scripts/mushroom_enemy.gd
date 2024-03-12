extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var player = get_node("/root/ForestScene/MainChar/MCCol")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var enemy_sprite = $EnemySprite

func _ready():
	pass
	# enemy_sprite.animation_looped.connect()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Comienza el movimiento hacia el jugador
	var direction = global_position.direction_to(player.global_position)
	velocity.x = direction.x * 80.0
	enemy_sprite.flip_h = direction.x < 0
	move_and_slide()
	
func die():
	enemy_sprite.play("hurt")
	await get_tree().create_timer(0.5).timeout
	queue_free()
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
