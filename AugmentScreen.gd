extends ColorRect

#todo hacer entera

func _on_button_pressed():
	hideAugments()

func showAugments():
	get_tree().paused = true
	visible = true

func hideAugments():
	visible = false
	get_tree().paused=false
