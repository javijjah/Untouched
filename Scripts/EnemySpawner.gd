extends Area2D

@onready var enemy_spawner_col = $EnemySpawnerCol
@onready var enemy_spawner_time = $EnemySpawnerTime

var enemiesThisLevel = 10
var enemiesSpawned = 0
func _ready():
	enemy_spawner_time.timeout.connect(spawnEnemy)
	
#TODO hardcodeado por el momento, probablemente calculado por ecuación más adelante
func calculateEnemiesForNewLevel(level):
	match (level):
		1:
			enemiesThisLevel=11
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
	print (enemiesThisLevel,enemiesSpawned)
func spawnEnemy():
	if enemiesThisLevel>enemiesSpawned:
		var newEnemy = preload("res://Scenes/mushroom_enemy.tscn").instantiate()
		print("Enemy Spawned")
		#FIXME comprobar qué coño le pasa a la posición global
		newEnemy.global_position = enemy_spawner_col.global_position
		if newEnemy:
			enemiesSpawned+=1
		add_child(newEnemy)
