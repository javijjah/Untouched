extends CharacterBody2D

#region vars
@export var SPEED = 0
@export var JUMP_VELOCITY = 0
@export var numberOfKills = 0
@onready var mc_sprite = $MCSprite
@onready var mc_attack_area = $MCAttackArea
#Variable que utilizaremos para que el ataque no se pueda spammear.
#Hacemos que dependa de la animación para que el jugador no lo sienta injusto.
var is_attacking = false
#Sincronizamos la gravedad del proyecto con la que recibe este objeto.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#endregion
#region Funciones recurrentes
func _ready():
	#Conectamos la señal del loop de la aplicación con la función que devuelve a la animación "Idle" en caso de que acabe el ataque
	mc_sprite.animation_looped.connect(backToIdle)

func _unhandled_input(event):
	if Input.is_action_pressed("UpAttack") and is_attacking==false:
		attack(0)
	elif Input.is_action_pressed("LeftAttack") and is_attacking==false:
		attack(1)
	elif Input.is_action_pressed("DownAttack") and is_attacking==false:
		attack(2)
	elif Input.is_action_pressed("RightAttack") and is_attacking==false:
		attack(3)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
#endregion
#region Funciones secuenciales
func attack(attackPos:int):
	mc_sprite.play("attack")
	var bodiesInAttackRange = mc_attack_area.get_overlapping_bodies()
	is_attacking=true
	for body in bodiesInAttackRange:
		if body.has_method("process_attack"):
			var attackAttemp = body.process_attack(attackPos)
			if attackAttemp:
				numberOfKills+=1
				print(numberOfKills)
func backToIdle():
	if mc_sprite.animation=="attack":
		mc_sprite.play("idle")
		is_attacking=false
		
#endregion
