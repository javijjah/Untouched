extends Area2D

@onready var enemy_spawner_col = $EnemySpawnerCol
@onready var enemy_spawner_time = $EnemySpawnerTime

var enemiesThisLevel = 10
var enemiesSpawned = 0
#THESE NUMBERS ARE NOT THE DIRECT CHANCE, BUT THE CHECKER ZONE THEY GET USING randi_range(0,100)
@export var redMushroomChance = 10
@export var blueMushroomChance = 5
@export var BallChance = 50
func _ready():
	enemy_spawner_time.timeout.connect(spawnEnemy)
	calculateEnemiesForNewLevel(WorldGlobalVariables.playerLevel)
func calculateEnemiesForNewLevel(level):
	calculateSpawningTime(level)
	match (level):
		1:
			enemiesThisLevel=5
		2:
			enemiesThisLevel=7
		3:
			enemiesThisLevel=10
		4:
			enemiesThisLevel=12
		5:
			enemiesThisLevel=14
		6:
			enemiesThisLevel=17
		7:
			enemiesThisLevel=20
		8:
			enemiesThisLevel=24
		9:
			enemiesThisLevel=28
		_:
			enemiesThisLevel=30
	enemiesSpawned = 0
	print ("Enemigos spawneados:",enemiesThisLevel)

func calculateSpawningTime(level):
	match (level):
		1:
			enemy_spawner_time.wait_time=3
		2:
			enemy_spawner_time.wait_time=2.6
		3:
			enemy_spawner_time.wait_time=2.2
		4:
			enemy_spawner_time.wait_time=2.0
		5:
			enemy_spawner_time.wait_time=1.7
		6:
			enemy_spawner_time.wait_time=1.4
		7:
			enemy_spawner_time.wait_time=1.2
		8:
			enemy_spawner_time.wait_time=1.0
		9:
			enemy_spawner_time.wait_time=0.9
		10:
			enemy_spawner_time.wait_time=0.8
		_:
			enemy_spawner_time.wait_time=0.8
			enemy_spawner_time.wait_time-=0.01
func spawnEnemy():
	if enemiesThisLevel>enemiesSpawned:
		var newEnemy = preload("res://Scenes/MushroomEnemy.tscn").instantiate()
		var champSpawningChance = randi_range(0,100)
		if champSpawningChance<=blueMushroomChance && WorldGlobalVariables.playerLevel>3:
			newEnemy = preload("res://Scenes/BlueMushroom.tscn").instantiate()
		elif champSpawningChance>blueMushroomChance && champSpawningChance<=redMushroomChance && WorldGlobalVariables.playerLevel>3:
			newEnemy = preload("res://Scenes/RedMushroom.tscn").instantiate()
		if champSpawningChance>redMushroomChance && champSpawningChance <= BallChance && WorldGlobalVariables.playerLevel>6:
			newEnemy = preload("res://Scenes/ballEnemy.tscn").instantiate()
		print("Enemy Spawned")
		print("Timer enemigo", enemy_spawner_time.wait_time)
		newEnemy.global_position = enemy_spawner_col.position
		if newEnemy:
			enemiesSpawned+=1
		add_child(newEnemy)
		if champSpawningChance<=blueMushroomChance && WorldGlobalVariables.playerLevel>3:
			newEnemy._speed *= 2
