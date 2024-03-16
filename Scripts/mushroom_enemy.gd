extends CharacterBody2D

#region vars
 # todo aumentar velocidad en función del nivel del jugador
const _speed = 100.0
# useless por el momento
const JUMP_VELOCITY = -400.0
var weakpoint = 0
@onready var player = get_node("/root/ForestScene/MainChar/MCCol")
@onready var weak_point_sprite = $WeakPointSprite
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var enemy_sprite = $EnemySprite
@onready var attack_area = $AttackArea
#endregion
#region Funciones recurrentes
func _ready():
	weakpoint = WorldGlobalVariables.rng.randi_range(0,3)
	weak_point_sprite.frame = weakpoint
	# enemy_sprite.animation_looped.connect()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Comienza el movimiento hacia el jugador
	var direction = Vector2(-1,-1)#global_position.direction_to(player.global_position)
	velocity.x = sign(direction.x) * _speed
	#var direction = global_position.direction_to(Vector2(0,0))
	enemy_sprite.flip_h = direction.x < 0
	move_and_slide()
#endregion
#region funciones secuenciales
func process_attack(attackPos:int):
	if attackPos==weakpoint:
		die()
		return true
	else:
		failed_attack()
		return false

func die():
	enemy_sprite.play("hurt")
	set_physics_process(false)
	await enemy_sprite.animation_finished
	queue_free()

func failed_attack():
	print("Attack failed")
	
#endregion
#region signals
func _on_attack_area_body_entered(body):
	if body.name=="MainChar":
		enemy_sprite.play("attack1")
		print("Enemy Attacking")
		await enemy_sprite.animation_finished
		await get_tree().create_timer(WorldGlobalVariables.attackingTime).timeout
		if body.has_method("process_attack"):
			print("Attack launched")
			body.process_attack()
		
#endregion
