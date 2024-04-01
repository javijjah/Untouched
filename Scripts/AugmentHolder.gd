extends Node2D

var AugmentList = {
	"Random Augment":{
		"Title": "Random Augment",
		"Texture": "res://augmentsSelected/RandomAug.png",
		"Description": "Gets a Random Augment"
	},
	"Bleeding Cut":{
		"Title": "Bleeding Cut",
		"Texture": "res://AsepriteFiles/scrollItest.png",
		"Description": "Get a bonus kill when killing 2 enemies with the same weakpoint"
	},
	"Thick Skin":{
		"Title": "Thick Skin",
		"Texture": "res://augmentsSelected/finished/ChanceToSurviveAug.png",
		"Description": "You have a chance of surviving a hit"
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
