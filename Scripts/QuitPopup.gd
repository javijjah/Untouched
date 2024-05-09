extends Control


func _on_yeah_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_nonono_pressed():
	queue_free()
