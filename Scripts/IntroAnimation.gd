extends Control
@onready var animation_player = $AnimationPlayer
@export var next_scene:PackedScene


func _on_animation_player_animation_finished(dummy):
	SceneManager.change_scene("res://Scenes/MainMenu.tscn")
