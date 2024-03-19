extends TextureProgressBar

#todo hacer que no se vea como al 100
#todo que el levelUp suceda al terminar la animación de kill y espere un poco más
var totalXP:int = 50

func updateProgressBar(currentXP):
	value = (currentXP/totalXP) *100
