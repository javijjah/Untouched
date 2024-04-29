class_name SaveManager
extends Resource

const SAVE_GAME_PATH := "user://savegame.tres"
var Savedscore = 0
func save_to_file(score):
	pass

func save_game(score) -> void:
	Savedscore = score
	ResourceSaver.save(self,SAVE_GAME_PATH) #TODO seguir aquí para los guardados
func load_game() -> Resource:
	if ResourceLoader.exists(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return null
