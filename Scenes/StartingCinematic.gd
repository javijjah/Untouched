extends Node2D
@onready var master_body = $MasterBody
@onready var main_char = $MainChar
@onready var animation_player = $AnimationPlayer

func _ready():
	await animation_player.animation_finished
	var dialogue = Dialogic.start("res://Dialogic/Timelines/testTimeline.dtl")
