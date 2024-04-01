extends Node

var rng = RandomNumberGenerator.new()
var attackingTime:float = 0.01
signal enemyKilled(xp)
signal playerDeath
signal PlayerLevelUp(level)
signal augmentObtained
func _ready():
	pass
