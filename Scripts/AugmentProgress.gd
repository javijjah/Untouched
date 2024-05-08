extends TextureProgressBar

#todo que el levelup espere un poco más
#TODO no hardcodear los 50 de xp para subir de nivel
var currXP:int = 0
var totalXP:int = 50

func updateProgressBar(newXP):
	currXP+=newXP
	value = (currXP*100)/totalXP
	print("Valor aumento: ", value)

func resetBar(level):
	print("Reset Progress Bar called")
	currXP = 0
	totalXP = 50
	updateProgressBar(0)
