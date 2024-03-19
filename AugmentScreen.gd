extends ColorRect

#todo hacer entera
#todo crear lista de aumentos disponibles
func _on_button_pressed():
	hideAugments()

func showAugments(level):
	get_tree().paused = true
	visible = true

func hideAugments():
	visible = false
	get_tree().paused=false
