extends Control


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/forest_scene.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
