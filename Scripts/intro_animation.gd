extends Control
@onready var animation_player = $AnimationPlayer



func _on_animation_player_animation_finished():
	SceneManager.change_scene("res://Scenes/main_menu.tscn")
