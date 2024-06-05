extends Node

var rng = RandomNumberGenerator.new()
var attackingTime:float = 0.01
var playerLevel = 1
signal enemyKilled(xp)
signal playerDeath
signal PlayerLevelUp(level)
signal augmentObtained(augment)
func _ready():
	pass
