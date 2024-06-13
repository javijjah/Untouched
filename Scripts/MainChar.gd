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
@export var gameOverHighscoreScene:PackedScene
@export var gameOverScene:PackedScene
@onready var mc_sprite = $MCSprite
@onready var mc_attack_area = $MCAttackArea
@onready var air_swing = $Sounds/AirSwing
@onready var dropped_sword = $Sounds/DroppedSword
@onready var wood_hitting = $Sounds/WoodHitting
@onready var animation_player = $AnimationPlayer

#
#This var stops the player for spamming the attack. I made it dependant on the animation, so the player doesn't feel it unfair
var is_attacking = false
#syncing gravity with the object
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#endregion
#region Funciones recurrentes
#FIXME visual bug when enemy attacking between animations
func _ready():
	calculateNewXP(0)
	WorldGlobalVariables.playerLevel=level
	isReloading = true
	await get_tree().create_timer(3).timeout
	isReloading = false
	mc_sprite.animation_looped.connect(backToIdle)
	mc_sprite.sprite_frames.set_animation_speed("attack",attack_speed)

func _unhandled_input(event):
	#This allows for a quick restart from the match itself
	if Input.is_action_pressed("Restart"):
		if !isReloading:
			SceneManager.change_scene("res://Scenes/forest_scene.tscn",{"pattern": "scribbles"})
	#All attacks, only doable if the character is alive
	if !isDead:
		if Input.is_action_pressed("UpAttack") and is_attacking==false:
			attack(0)
		elif Input.is_action_pressed("LeftAttack") and is_attacking==false:
			attack(1)
		elif Input.is_action_pressed("DownAttack") and is_attacking==false:
			attack(2)
		elif Input.is_action_pressed("RightAttack") and is_attacking==false:
			attack(3)
		elif Input.is_action_pressed("UpAttackAr") and is_attacking==false:
			attack(4)
		elif Input.is_action_pressed("LeftAttackAr") and is_attacking==false:
			attack(5)
		elif Input.is_action_pressed("DownAttackAr") and is_attacking==false:
			attack(6)
		elif Input.is_action_pressed("RightAttackAr") and is_attacking==false:
			attack(7)
		elif Input.is_action_just_pressed("Pause"):
			if get_tree().paused == false:
				wood_hitting.play()
				get_parent().add_child(preload("res://Scenes/PauseScene.tscn").instantiate())
#Searches all bodies in the attack range and, if they can process an attack, they do it
func attack(attackPos:int):
	mc_sprite.play("attack")
	air_swing.play()
	var bodiesInAttackRange = mc_attack_area.get_overlapping_bodies()
	is_attacking=true
	for body in bodiesInAttackRange:
		if body.has_method("process_attack"): #FIXME bug killing multiple enemies for previously freed
			if randi_range(0,100)<penChance:
				body.die()
			var attackAttemp = body.process_attack(attackPos)
			if attackAttemp:
				if xpToLevelUp-xp<=5:
					await body.tree_exited
				numberOfKills+=1
				bleedingCutUp()
				WorldGlobalVariables.enemyKilled.emit(body.xpOnKill)
				print("Given XP from kill:",body.xpOnKill)
				print("enemies killed:", numberOfKills)
				print("Current player XP:", xp)
			else:
				bleedingCutDown()

#Returns from the attack animation to idle
func backToIdle():
	if mc_sprite.animation=="attack":
		mc_sprite.play("idle")
		is_attacking=false
#Receiving XP for the mainChar method
func gainXP(newxp):
	if newxp+xp>=xpToLevelUp:
		levelUp()
		#xp = (newxp+xp) - xpToLevelUp
		xp = 0
	else:
		xp += newxp
#It generates an AugmentScreen at the same time it levels up
func levelUp():
	level+=1
	wood_hitting.play()
	get_parent().add_child.call_deferred((preload("res://Scenes/AugmentScreen.tscn").instantiate()))
	WorldGlobalVariables.playerLevel+=1
	calculateNewXP(0)
	WorldGlobalVariables.PlayerLevelUp.emit(level)
	print("Level up to ",level)
	#"Disables" the player and slowly plays a smoke and sound for a more ambient death
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
		get_parent().add_child(gameOverHighscoreScene.instantiate())
	else:
		get_parent().add_child(gameOverScene.instantiate())
	SaveManage.save_game(numberOfKills)
	get_tree().paused = true
#This makes it for a more cinematic gameOver scene
func hideEverythingExceptPlayer():
	for node in get_parent().get_children():
		if node.name == "MainChar":
			pass
		else:
			#node.hide()
			node.queue_free()
#Recieving an attack method
func process_attack():
	if randi_range(0,100)>chanceToSurviveHit:
		die()
func calculateNewXP(dummy):
	match (level):
		1:
			xpToLevelUp=5*5
		2:
			xpToLevelUp=7*5
		3:
			xpToLevelUp=10*5
		4:
			xpToLevelUp=12*5
		5:
			xpToLevelUp=14*5
		6:
			xpToLevelUp=17*5
		7:
			xpToLevelUp=20*5
		8:
			xpToLevelUp=24*5
		9:
			xpToLevelUp=28*5
		_:
			xpToLevelUp=30*5
#endregion
#region augments
#Each augment will be processed just when picked up, and modify variables in the player code
func processAugment(aug):
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
				AugmentHolder.selectAugment(AugmentHolder.BaseAugments.keys().pick_random())
			"Bleeding Cut": #TODO func multiple bleeding cut
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
#manager for the bleeding cut extra kill up and down
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
