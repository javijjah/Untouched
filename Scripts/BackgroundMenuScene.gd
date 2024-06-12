extends Node2D
@onready var character_body_2d = $CharacterBody2D
@onready var parallax_background = $ParallaxBackground

#This scene is just the background for the main menu
func _process(delta):
	parallax_background.scroll_offset.x += -30 * delta
