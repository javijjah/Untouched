extends Control

#TODO Mostrar aumentos que tiene el jugador aquí y en pausa
#@onready var new_highscore = $CenterContainer/VBoxContainer/NewHighscore

func _on_button_pressed():
	print("PressedPlayAgain")
	get_tree().paused = false
	SceneManager.change_scene("res://Scenes/forest_scene.tscn")

func _on_quit_pressed():
	print("PressedQuit")
	get_tree().paused = false
	SceneManager.change_scene("res://Scenes/main_menu.tscn")
