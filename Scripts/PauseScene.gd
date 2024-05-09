extends Control
@onready var center_container = $CenterContainer

func _ready():
	get_tree().paused = true
func _on_button_pressed():
	get_tree().paused = false
	queue_free()

func _on_button_2_pressed():
	center_container.add_child(preload("res://Scenes/QuitPopup.tscn").instantiate())

	
