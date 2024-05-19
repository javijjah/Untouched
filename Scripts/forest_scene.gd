extends Node2D
#region var
@onready var enemy_spawner = $EnemySpawner
@onready var kill_counter = $CanvasLayer/KillCounter
@onready var main_char = $MainChar
@onready var augment_progress = $CanvasLayer/AugmentProgress
#@onready var augment_screen = $AugmentScreen
@onready var augment_holder = $AugmentHolder

#endregion

#region funciones recurrentes
func _ready():
	kill_counter.text = str(main_char.numberOfKills)
	augment_progress.value=0
	barTotalUpdate(0)
	WorldGlobalVariables.enemyKilled.connect(labelUpdate)
	WorldGlobalVariables.enemyKilled.connect(augment_progress.updateProgressBar)
	WorldGlobalVariables.enemyKilled.connect(main_char.gainXP)
	WorldGlobalVariables.PlayerLevelUp.connect(enemy_spawner.calculateEnemiesForNewLevel)
	WorldGlobalVariables.PlayerLevelUp.connect(enemy_spawner.calculateSpawningTime)
	WorldGlobalVariables.PlayerLevelUp.connect(augment_progress.resetBar)
	WorldGlobalVariables.PlayerLevelUp.connect(barTotalUpdate)
	WorldGlobalVariables.augmentObtained.connect(processAugments)
#endregion
#region funciones secuenciales

#parametro solo para no recibir error de consola por la señal
func labelUpdate(dummy):
	kill_counter.text = str(main_char.numberOfKills)
#endregion
func barTotalUpdate(dummy):
	augment_progress.changeTotal(main_char.xpToLevelUp)
func processAugments(key):
	main_char.processAugment(key["Title"])

