class_name SaveManager
extends Node

const SAVE_GAME_PATH := "user://savegame.tres"
var loadedhighscore:int = 0
var firstLaunch = true
func save_game(score):
	var saved_game:PlayerData = PlayerData.new()
	if score > loadedhighscore:
		saved_game.highscore = score
		print("New Highscore: ", saved_game.highscore)
	saved_game.firstLaunch=firstLaunch
	print("firstLaunch?:", firstLaunch)
	ResourceSaver.save(saved_game,SAVE_GAME_PATH)
		
func load_game():
	var saved_game:PlayerData = load(SAVE_GAME_PATH) as PlayerData
	if saved_game==null:
		saved_game = PlayerData.new()
	loadedhighscore = saved_game.highscore
	firstLaunch = saved_game.firstLaunch
	print("Highscore:",loadedhighscore)
	print("firstLaunch?:", firstLaunch)
