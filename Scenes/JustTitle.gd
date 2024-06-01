extends Label

func _ready():
	await get_tree().create_timer(5).timeout
	SceneManager.change_scene("res://Scenes/ForestScene.tscn")
	SaveManage.firstLaunch = false
	SaveManage.save_game(0)
