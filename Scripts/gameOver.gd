extends Control

#TODO generarlo por carga y cuando haga escena de pausa igual con los iconos de los aumentos que tiene el jugador
@onready var new_highscore = $CenterContainer/VBoxContainer/NewHighscore

func _ready():
	# TODO
	new_highscore.visible = true
	
func _on_button_pressed():
	print("PressedPlayAgain")
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	print("PressedQuit")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

