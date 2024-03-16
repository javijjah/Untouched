extends Area2D

@onready var enemy_spawner_col = $EnemySpawnerCol
var enemiesThisLevel = 0
var enemiesSpawned = 0
func _ready():
	pass
	
# hardcodeado por el momento, probablemente calculado por ecuación más adelante
func calculateEnemiesForNewLevel(level):
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


func spawnEnemy():
	var newEnemy = preload("res://Scenes/mushroom_enemy.tscn").instantiate()
	print("Enemy Spawned")
	newEnemy.global_position = enemy_spawner_col.global_position
	if newEnemy:
		enemiesSpawned+=1
	add_child(newEnemy)
