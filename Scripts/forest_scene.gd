extends Node2D

@onready var enemy_spawn_time = $EnemySpawnTime
@onready var enemy_spawner = $EnemySpawner
@onready var enemy_spawner_col = $EnemySpawner/EnemySpawnerCol

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_spawn_time.timeout.connect(spawnEnemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawnEnemy():
	var newEnemy = preload("res://Scenes/mushroom_enemy.tscn").instantiate()
	print("Enemy Spawned")
	print(newEnemy.global_position)
	newEnemy.global_position = enemy_spawner_col.global_position
	print("Enemy moved to")
	print(newEnemy.global_position)
	add_child(newEnemy)
