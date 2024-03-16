extends Node2D
#region var
@onready var enemy_spawn_time = $EnemySpawnTime
@onready var enemy_spawner = $EnemySpawner
@onready var enemy_spawner_col = $EnemySpawner/EnemySpawnerCol
@onready var kill_counter = $KillCounter
@onready var main_char = $MainChar
@onready var augment_progress = $CanvasLayer/AugmentProgress
@onready var game_over = $GameOver
@onready var augment_screen = $AugmentScreen
#endregion

#region funciones recurrentes
func _ready():
	kill_counter.text = str(main_char.numberOfKills)
	enemy_spawn_time.timeout.connect(enemy_spawner.spawnEnemy)
	augment_progress.value=0
	WorldGlobalVariables.enemyKilled.connect(labelUpdate)
	WorldGlobalVariables.enemyKilled.connect(advanceProgressBar)
	WorldGlobalVariables.playerDeath.connect(game_over.gameOver)
	main_char.PlayerLevelUp.connect(augment_screen.showAugments)
#endregion
#region funciones secuenciales

#todo hacer que no se vea como al 100
#todo que el levelUp suceda al terminar la animación de kill y espere un poco más
func advanceProgressBar():
	if augment_progress.value<100:
		augment_progress.value+=10
	elif augment_progress.value>89:
		main_char.levelUp()
		augment_screen.showAugments()
		augment_progress.value=0

func labelUpdate():
	kill_counter.text = str(main_char.numberOfKills)

#endregion
