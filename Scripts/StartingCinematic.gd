extends Node2D
@onready var master_body = $MasterBody
@onready var main_char = $MainChar
@onready var animation_player = $AnimationPlayer
@onready var enemy_body = $EnemyBody

func _ready():
	await animation_player.animation_finished
	enemy_body.position
	var dialogue = Dialogic.start("res://Dialogic/Timelines/testTimeline.dtl")
	Dialogic.timeline_ended.connect(killingMasterCinematic)
	enemy_body.get_child(2).hide()
	#TODO lock mov jugador aquí
func killingMasterCinematic():
	animation_player.play("enemyEntering")
	await get_tree().create_timer(5).timeout
	enemy_body.get_child(0).play("attack1")
	await get_tree().create_timer(0.7).timeout
	SceneManager.change_scene("res://Scenes/JustTitle.tscn",{"skip_fade_out":true,"skip_fade_in":true})
