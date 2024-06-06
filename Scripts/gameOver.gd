extends Control


func _on_button_pressed():
	print("PressedPlayAgain")
	get_tree().paused = false
	SceneManager.change_scene("res://Scenes/ForestScene.tscn")

func _on_quit_pressed():
	print("PressedQuit")
	get_tree().paused = false
	SceneManager.change_scene("res://Scenes/MainMenu.tscn")
