extends Control
@onready var high_score = $CenterContainer/VBoxContainer/HighScore
@onready var match_started = $Sounds/MatchStarted
var firstLaunch = true
func _ready():
	SaveManage.load_game()
	if SaveManage.loadedhighscore>0:
		high_score.text = "High Score: " + str(SaveManage.loadedhighscore)
	if SaveManage.firstLaunch:
		add_child(preload("res://Scenes/FirstTimePopup.tscn").instantiate())
	
func _on_play_button_pressed():
	match_started.play()
	await match_started.finished
	get_tree().change_scene_to_file("res://Scenes/forest_scene.tscn")


func _on_quit_button_pressed():
	get_tree().quit()

