extends Node2D
# TODO revisión: hacer que el samurai se mueva
# TODO arreglar pixel de los aumentos
# TODO fijar el game breaking
# TODO Scriptable Objects
# TODO cámara de movimiento ágil, que se mueva el jugador o fakearlo al menos
# TODO Añade un dialoguito la primera vez que se abra, eso se guarda en un archivo de guardado
var AugmentList = {
	"Random Augment":{ #TODO
		"Title": "Random Augment",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/RandomAug.png",
		"Description": "Gets a Random Augment"
	},
	"Bleeding Cut":{ #TODO
		"Title": "Bleeding Cut",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/scrollItest.png",
		"Description": "Get a bonus kill when killing 2 enemies with the same weakpoint"
	},
	"Thick Skin":{ 
		"Title": "Thick Skin",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/ChanceToSurviveAug.png",
		"Description": "You have a chance of surviving a hit"
	},
	"Cool Hat":{ #TODO
		"Title": "Cool Hat",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/hat.png",
		"Description": "Gives you a cool hat"
	},
	"Crystal Ball":{ #TODO
		"Title": "Crystal Ball",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/seeTheFutureAug.png",
		"Description": "Take a peek at your 3 next Augment Pages"
	},
	"Repelling Aura":{ #TODO
		"Title": "Repelling Aura",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/auraAug.png",
		"Description": "Knock Back all enemies near you"
	},
	"Sword Sharpening":{ #TODO
		"Title": "Sword Sharpening",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/parry.png",
		"Description": "Get some attack speed"
	},
	"Ouroboros":{ #TODO
		"Title": "Ouroboros",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/ouroboros.png",
		"Description": "You can get all augments again"
	}
	}
var activeAugments = {
	
}

func pickRandomAugment():
	return  AugmentHolder.AugmentList[AugmentHolder.AugmentList.keys().pick_random()]

func selectAugment(key):
	activeAugments[key] = AugmentList[key]
	WorldGlobalVariables.augmentObtained.emit()
	AugmentList.erase(key)
