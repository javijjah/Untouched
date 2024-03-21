extends ColorRect

#todo hacer entera
#todo crear lista de aumentos disponibles
func _on_button_pressed():
	hideAugments()

func loadAugments():
	var firstAugment = load("res://Scenes/AugmentCard.tscn").instantiate()
	var secondAugment = load("res://Scenes/AugmentCard.tscn").instantiate()
	var thirdAugment = load("res://Scenes/AugmentCard.tscn").instantiate()
	firstAugment.modifyAugmentCard()
	add_child()

func showAugments(level):
	get_tree().paused = true
	visible = true

func hideAugments():
	visible = false
	get_tree().paused=false
