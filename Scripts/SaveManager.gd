extends Node

var score = 0
func save_to_file(score):
	var saveFile = [{
		"score": score
	}]
	return saveFile

func save_game(score):
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(save_to_file(score))
	save_game.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
		
	var save_game = FileAccess.open("user://savegame.save",FileAccess.READ)

	while  save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		print(node_data)
		
