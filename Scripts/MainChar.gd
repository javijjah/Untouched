extends CharacterBody2D

#region vars
#@export var SPEED = 0
#@export var JUMP_VELOCITY = 0
@export var numberOfKills = 0
@export var level = 1
@export var xp = 0
@export var xpToLevelUp = 50
@export var chanceToSurviveHit = 0
@export var attack_speed = 11
@export var bleedingCutKills = -1
@export var penChance = 0
@export var isDead = false
@export var isReloading = false
@onready var mc_sprite = $MCSprite
@onready var mc_attack_area = $MCAttackArea
@onready var air_swing = $Sounds/AirSwing
@onready var dropped_sword = $Sounds/DroppedSword
@onready var wood_hitting = $Sounds/WoodHitting
@onready var animation_player = $AnimationPlayer

#Variable que utilizaremos para que el ataque no se pueda spammear.
#Hacemos que dependa de la animación para que el jugador no lo sienta injusto.
var is_attacking = false
#Sincronizamos la gravedad del proyecto con la que recibe este objeto.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#endregion
#region Funciones recurrentes

func _ready():
	WorldGlobalVariables.playerLevel=level
	isReloading = true
	await get_tree().create_timer(3).timeout
	isReloading = false

	#Conectamos la señal del loop de la aplicación con la función que devuelve a la animación "Idle" en caso de que acabe el ataque
	mc_sprite.animation_looped.connect(backToIdle)
	mc_sprite.sprite_frames.set_animation_speed("attack",attack_speed)
func _unhandled_input(event):
	if Input.is_action_pressed("Restart"):
		if !isReloading:
			SceneManager.change_scene("res://Scenes/forest_scene.tscn",{"pattern": "scribbles"})
	if !isDead:
		if Input.is_action_pressed("UpAttack") and is_attacking==false:
			attack(0)
		elif Input.is_action_pressed("LeftAttack") and is_attacking==false:
			attack(1)
		elif Input.is_action_pressed("DownAttack") and is_attacking==false:
			attack(2)
		elif Input.is_action_pressed("RightAttack") and is_attacking==false:
			attack(3)
		elif Input.is_action_just_pressed("Pause"):
			if get_tree().paused == false:
				wood_hitting.play()
				get_parent().add_child(preload("res://Scenes/PauseScene.tscn").instantiate())
#func _physics_process(delta):
	#if not is_on_floor():
		#velocity.y += gravity * delta
	#
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	#
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
#endregion
#region Funciones secuenciales

func attack(attackPos:int):
	mc_sprite.play("attack")
	air_swing.play()
	var bodiesInAttackRange = mc_attack_area.get_overlapping_bodies()
	is_attacking=true
	for body in bodiesInAttackRange:
		if body.has_method("process_attack"):
			if randi_range(0,100)<penChance:
				body.die()
			var attackAttemp = body.process_attack(attackPos) #FIXME por el esperar a que las anim acaben, esto no mata varios enemigos con el mismo weakpoint a la vez
			if attackAttemp:
				await body.tree_exited
				numberOfKills+=1
				bleedingCutUp()
				WorldGlobalVariables.enemyKilled.emit(body.xpOnKill)
				print("Given XP from kill:",body.xpOnKill)
				print("enemies killed:", numberOfKills)
				print("Current player XP:", xp)
			else:
				bleedingCutDown()
func backToIdle():
	if mc_sprite.animation=="attack":
		mc_sprite.play("idle")
		is_attacking=false
		
func gainXP(newxp):
	if newxp+xp>=xpToLevelUp:
		levelUp()
		xp = (newxp+xp) - xpToLevelUp
	else:
		xp += newxp

func levelUp():
	level+=1
	wood_hitting.play()
	get_parent().add_child.call_deferred((preload("res://Scenes/AugmentScreen.tscn").instantiate()))
	WorldGlobalVariables.playerLevel+=1
	WorldGlobalVariables.PlayerLevelUp.emit(level)
	print("Level up to ",level)
func die():
	isDead=true
	print("Player Dead")
	AugmentHolder.reset()
	hideEverythingExceptPlayer()
	mc_sprite.play("hurt")
	await mc_sprite.animation_finished
	mc_sprite.play("death")
	for i in 7:
		await mc_sprite.frame_changed
	dropped_sword.play()
	animation_player.play("fallingSmoke")
	await mc_sprite.animation_finished
	WorldGlobalVariables.playerDeath.emit()
	if numberOfKills>SaveManage.loadedhighscore:
		get_parent().add_child(preload("res://Scenes/gameOverHighscore.tscn").instantiate())
	else:
		get_parent().add_child(preload("res://Scenes/gameOver.tscn").instantiate())
	SaveManage.save_game(numberOfKills)
	get_tree().paused = true
func hideEverythingExceptPlayer():
	for node in get_parent().get_children():
		if node.name == "MainChar":
			pass
		else:
			#node.hide()
			node.queue_free()

func process_attack():
	if randi_range(0,100)>chanceToSurviveHit:
		die()
func calculateNewXP(dummy):
	match (level):
		1:
			xpToLevelUp=11*5
		2:
			xpToLevelUp=12*5
		3:
			xpToLevelUp=16*5
		4:
			xpToLevelUp=19*5
		5:
			xpToLevelUp=21*5
		6:
			xpToLevelUp=24*5
		7:
			xpToLevelUp=27*5
		8:
			xpToLevelUp=31*5
		9:
			xpToLevelUp=33*5
		10,11,12,13,14:
			xpToLevelUp=(24 + (level*10/6))*5
		_:
			xpToLevelUp=(50*5)
#endregion
#region augments
#Procesador de los aumentos, lo cual le da los atributos al jugador
func processAugment(aug):
	#for aug in AugmentHolder.activeAugments:
		match aug:
			"Thick Skin":
				print("Thick Skin procesed")
				chanceToSurviveHit+=15
			"Sword Sharpening":
				print("Sword Sharpening processed")
				attack_speed+=2
				mc_sprite.sprite_frames.set_animation_speed("attack",attack_speed)
			"Random Augment":
				print("Processing Random Augment")
				AugmentHolder.selectAugment(AugmentHolder.AugmentList.keys().pick_random())
			"Bleeding Cut": #TODO func multiples bleeding cut
				bleedingCutKills=0
			"Shrooms":
				print("Processing Shrooms")
				pass
				get_parent().add_child(preload("res://Scenes/ShroomsFilter.tscn").instantiate())
			"Penetrative Hit":
				print("Processing Penetrative Hit")
				penChance += 20
			_:
				print("Error trying to process \"", aug, "\"")


func bleedingCutUp():
	if bleedingCutKills>-1:
		bleedingCutKills+=1
		print("Bleeding cut up now has ", bleedingCutKills)
		if bleedingCutKills==5:
			print("Kill up by Bleeding Cut")
			numberOfKills+=1
			WorldGlobalVariables.enemyKilled.emit(5)
			bleedingCutKills=0

func bleedingCutDown():
	if bleedingCutKills>-1:
		print("BleedingCutRestarted")
		bleedingCutKills=0
#endregion
