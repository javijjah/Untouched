class_name SaveManager
extends Node

const SAVE_GAME_PATH := "user://savegame.tres"
var loadedhighscore:int = 0

func save_game(score):
	if score > loadedhighscore:
		var saved_game:PlayerData = PlayerData.new()
		saved_game.highscore = score
		print("New Highscore: ", saved_game.highscore)
		ResourceSaver.save(saved_game,SAVE_GAME_PATH)
		
func load_game():
	var saved_game:PlayerData = load(SAVE_GAME_PATH) as PlayerData
	loadedhighscore = saved_game.highscore
	print("Highscore:",loadedhighscore)
