extends Node2D
#region var
@onready var enemy_spawn_time = $EnemySpawnTime
@onready var enemy_spawner = $EnemySpawner
@onready var enemy_spawner_col = $EnemySpawner/EnemySpawnerCol
@onready var kill_counter = $KillCounter
@onready var main_char = $MainChar
var enemiesSpawned = 0
#endregion

#region funciones recurrentes
func _ready():
	enemy_spawn_time.timeout.connect(spawnEnemy)

func _process(delta):
	kill_counter.text = str(main_char.numberOfKills)
	# enemy_spawn_time.wait_time=1
#endregion
#region funciones secuenciales
func spawnEnemy():
	var newEnemy = preload("res://Scenes/mushroom_enemy.tscn").instantiate()
	print("Enemy Spawned")
	newEnemy.global_position = enemy_spawner_col.global_position
	if newEnemy:
		enemiesSpawned+=1
	add_child(newEnemy)
#endregion
