extends Control
@onready var high_score = $CenterContainer/VBoxContainer/HighScore

func _ready():
	# TODO y añadir texto de highscore
	SaveManager.save_game(2)
	SaveManager.load_game()
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/forest_scene.tscn")


func _on_quit_button_pressed():
	get_tree().quit()

