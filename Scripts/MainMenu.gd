extends Control
@onready var high_score = $CenterContainer/VBoxContainer/HighScore
@onready var match_started = $Sounds/MatchStarted
@onready var center_container = $CenterContainer
# TODO secuencia inicial
# TODO lista de highscores
# TODO otro enemigo
var firstLaunch = true
func _ready():
	SaveManage.load_game()
	if SaveManage.loadedhighscore>0:
		high_score.text = "High Score: " + str(SaveManage.loadedhighscore)
	if SaveManage.firstLaunch:
		center_container.add_child(preload("res://Scenes/FirstTimePopup.tscn").instantiate())
func _on_play_button_pressed():
	SceneManager.change_scene("res://Scenes/forest_scene.tscn",{"pattern": "scribbles"})
func _on_quit_button_pressed():
	get_tree().quit()
