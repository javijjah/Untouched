extends Node2D
#region var
@onready var enemy_spawn_time = $EnemySpawnTime
@onready var enemy_spawner = $EnemySpawner
@onready var enemy_spawner_col = $EnemySpawner/EnemySpawnerCol
@onready var kill_counter = $KillCounter
@onready var main_char = $MainChar
@onready var augment_progress = $CanvasLayer/AugmentProgress
@onready var game_over = $GameOver

var enemiesSpawned = 0
#endregion

#region funciones recurrentes
func _ready():
	kill_counter.text = str(main_char.numberOfKills)
	enemy_spawn_time.timeout.connect(spawnEnemy)
	augment_progress.value=0
	WorldGlobalVariables.enemyKilled.connect(labelUpdate)
	WorldGlobalVariables.enemyKilled.connect(advanceProgressBar)
	WorldGlobalVariables.playerDeath.connect(gameOver)
func _process(delta):
	pass
#endregion
#region funciones secuenciales
func spawnEnemy():
	var newEnemy = preload("res://Scenes/mushroom_enemy.tscn").instantiate()
	print("Enemy Spawned")
	newEnemy.global_position = enemy_spawner_col.global_position
	if newEnemy:
		enemiesSpawned+=1
	add_child(newEnemy)

func advanceProgressBar():
	if augment_progress.value<100:
		augment_progress.value+=10
	elif augment_progress.value>89:
		main_char.levelUp()
		augment_progress.value=0

func labelUpdate():
	kill_counter.text = str(main_char.numberOfKills)

func gameOver():
	print("Game Over")
	game_over.visible = true
	get_tree().paused = true
#endregion
