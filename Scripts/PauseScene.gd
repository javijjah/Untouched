extends Control
@onready var center_container = $CenterContainer
@onready var active_augments = $ActiveAugments
@onready var active_augment_container = $ActiveAugments/GridContainer
#FIXME no se ven todos los aumentos
func _ready():
	get_tree().paused = true
	fill_active_augments()
	set_position(Vector2(298,135))
func _on_button_pressed():
	get_tree().paused = false
	queue_free()

func _on_button_2_pressed():
	center_container.add_child(preload("res://Scenes/QuitPopup.tscn").instantiate())

func fill_active_augments():
	for aug in AugmentHolder.activeAugments:
		var text:TextureRect = TextureRect.new()
		text.texture = load(AugmentHolder.activeAugments[aug]["Texture"])
		active_augment_container.add_child(text)
	#
	#var test:TextureRect = TextureRect.new()
	#test.texture = load(AugmentHolder.BaseAugments["Bleeding Cut"]["Texture"])
	#active_augment_container.add_child(test)
	
