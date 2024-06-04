extends Area2D

@onready var enemy_spawner_col = $EnemySpawnerCol
@onready var enemy_spawner_time = $EnemySpawnerTime

var enemiesThisLevel = 10
var enemiesSpawned = 0
func _ready():
	enemy_spawner_time.timeout.connect(spawnEnemy)
	calculateEnemiesForNewLevel(WorldGlobalVariables.playerLevel)
#HACK hardcodeado por el momento, probablemente calculado por ecuación más adelante
func calculateEnemiesForNewLevel(level):
	calculateSpawningTime(level)
	match (level):
		1:
			enemiesThisLevel=10
		2:
			enemiesThisLevel=12
		3:
			enemiesThisLevel=16
		4:
			enemiesThisLevel=19
		5:
			enemiesThisLevel=21
		6:
			enemiesThisLevel=24
		7:
			enemiesThisLevel=27
		8:
			enemiesThisLevel=31
		9:
			enemiesThisLevel=33
		10,11,12,13,14:
			enemiesThisLevel=24 + (level*10/6)
		_:
			enemiesThisLevel=50
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
		if champSpawningChance<10:
			newEnemy = preload("res://Scenes/BlueMushroom.tscn").instantiate()
		elif champSpawningChance>=10 && champSpawningChance<20:
			newEnemy = preload("res://Scenes/RedMushroom.tscn").instantiate()
		print("Enemy Spawned")
		print("Timer enemigo", enemy_spawner_time.wait_time)
		newEnemy.global_position = enemy_spawner_col.position
		if newEnemy:
			enemiesSpawned+=1
		add_child(newEnemy)
		if champSpawningChance<10:
			newEnemy._speed *= 2
