extends Control

#Deprecated first launch popup
func _on_button_pressed():
	SaveManage.firstLaunch=false
	SaveManage.save_game(0)
	queue_free()
