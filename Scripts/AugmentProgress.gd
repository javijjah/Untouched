extends TextureProgressBar

var currXP:int = 0
var totalXP:int = 50

func updateProgressBar(newXP):
	currXP+=newXP
	value = (currXP*100)/totalXP
	print("Valor aumento: ", value)

func resetBar(dummy):
	print("Reset Progress Bar called")
	currXP = 0
	updateProgressBar(0)

func changeTotal(newTotal):
	totalXP = newTotal
