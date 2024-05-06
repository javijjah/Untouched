extends Control
@onready var high_score = $CenterContainer/VBoxContainer/HighScore

func _ready():
	SaveManage.load_game()
	if SaveManage.loadedhighscore>0:
		high_score.text = "High Score: " + str(SaveManage.loadedhighscore)
	# TODO y añadir texto de highscore
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/forest_scene.tscn")


func _on_quit_button_pressed():
	get_tree().quit()

