extends ColorRect

#TODO generarlo por carga y cuando haga escena de pausa igual con los iconos de los aumentos que tiene el jugador
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func gameOver():
	print("Game Over")
	visible = true
	get_tree().paused = true
