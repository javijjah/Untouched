extends Control
@onready var main_menu = $MainMenu
@onready var high_score = $MainMenu/CenterContainer/VBoxContainer/HighScore
@onready var center_container = $MainMenu/CenterContainer
@onready var extra_buttons = $MainMenu/ExtraButtons

@onready var options_menu = $OptionsMenu
@onready var options_cont = $OptionsMenu/OptionsCont
@onready var test_sfx = $Sounds/TestSFX
@onready var master_slider = $OptionsMenu/OptionsCont/VBoxContainer/MasterVol/MasterSlider
@onready var music_slider = $OptionsMenu/OptionsCont/VBoxContainer/MusicVol/MusicSlider
@onready var sfx_slider = $OptionsMenu/OptionsCont/VBoxContainer/SFXVol/SFXSlider
@onready var erasebutton = $OptionsMenu/OptionsCont/VBoxContainer/Button
@onready var credits = $Credits

var firstLaunch = true
var master_bus
var music_bus
var sfx_bus
func _ready():
	SaveManage.load_game()
	if SaveManage.loadedhighscore>0:
		high_score.text = "High Score: " + str(SaveManage.loadedhighscore)
	#Deprecated popup for the first launch
	#if SaveManage.firstLaunch:
		#center_container.add_child(preload("res://Scenes/FirstTimePopup.tscn").instantiate())
	master_bus = AudioServer.get_bus_index("Master")
	music_bus = AudioServer.get_bus_index("Music")
	sfx_bus = AudioServer.get_bus_index("SFX")
	master_slider.value = 0.5
	music_slider.value = 0.5
	sfx_slider.value = 0.5
	#Game launching button
func _on_play_button_pressed():
	if SaveManage.firstLaunch:
		SceneManager.change_scene("res://Scenes/StartingCinematic.tscn")
	else:
		SceneManager.change_scene("res://Scenes/ForestScene.tscn",{"pattern": "scribbles"})
func _on_quit_button_pressed():
	get_tree().quit()

func _on_options_button_pressed():
	print("OptionsPressed")
	main_menu.hide()
	options_menu.show()
	
func _on_credits_button_pressed():
	print("CreditsPressed")
	main_menu.hide()
	credits.show()

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
	print("erasepressed")
	SaveManage.erase_highscores()
	high_score.text = ""
	erasebutton.disabled = true

func _on_back_to_main_button_pressed():
	print("backpressed")
	options_menu.hide()
	main_menu.show()


func _on_back_to_main_button_credits_pressed():
	credits.hide()
	main_menu.show()
