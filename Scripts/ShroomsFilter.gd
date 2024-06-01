extends Control
@onready var animation_player = $AnimationPlayer
@onready var animation_player_2 = $AnimationPlayer2

func _ready():
	animation_player_2.play("startingtrip")
	animation_player.play("colorchange")
