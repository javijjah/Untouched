extends Control
@onready var high_score = $CenterContainer/VBoxContainer/HighScore
@onready var match_started = $Sounds/MatchStarted
@onready var center_container = $CenterContainer
@onready var extra_buttons = $ExtraButtons
@onready var options_cont = $OptionsCont
@onready var test_sfx = $TestSFX
@onready var master_slider = $OptionsCont/VBoxContainer/MasterVol/MasterSlider
@onready var music_slider = $OptionsCont/VBoxContainer/MusicVol/MusicSlider
@onready var sfx_slider = $OptionsCont/VBoxContainer/SFXVol/SFXSlider

# TODO secuencia inicial
# TODO lista de highscores
# TODO otro enemigo
# TODO reworkear dificultad
# TODO opciones y créditos
# TODO mayúsculas ficheros proyecto
var firstLaunch = true
var master_bus
var music_bus
var sfx_bus
func _ready():
	SaveManage.load_game()
	if SaveManage.loadedhighscore>0:
		high_score.text = "High Score: " + str(SaveManage.loadedhighscore)
	if SaveManage.firstLaunch:
		center_container.add_child(preload("res://Scenes/FirstTimePopup.tscn").instantiate())
	master_bus = AudioServer.get_bus_index("Master")
	music_bus = AudioServer.get_bus_index("Music")
	sfx_bus = AudioServer.get_bus_index("SFX")
	master_slider.value = 0.5
	music_slider.value = 0.5
	sfx_slider.value = 0.5
	print(master_slider.value)
func _on_play_button_pressed():
	SceneManager.change_scene("res://Scenes/forest_scene.tscn",{"pattern": "scribbles"})
func _on_quit_button_pressed():
	get_tree().quit()

func _on_options_button_pressed():
	print("OptionsPressed") # TODO
	center_container.hide()
	extra_buttons.hide()
	options_cont.show()
	
func _on_credits_button_pressed():
	print("CreditsPressed") # TODO

func _on_master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(
		master_bus,
		linear_to_db(value)
	)


func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(
		music_bus,
		linear_to_db(value)
	)


func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(
		sfx_bus,
		linear_to_db(value)
	)


func _on_sfx_slider_drag_ended(value_changed):
	test_sfx.play()
	print(AudioServer.get_bus_volume_db(sfx_bus))


func _on_button_pressed():
	SaveManager.erase_game()
