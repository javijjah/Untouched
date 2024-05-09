extends Control

#TODO Mostrar aumentos que tiene el jugador aquí y en pausa
#@onready var new_highscore = $CenterContainer/VBoxContainer/NewHighscore

func _ready():
	pass
	#new_highscore.visible = true #TODO highscore gameover
	
func _on_button_pressed():
	print("PressedPlayAgain")
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	print("PressedQuit")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

