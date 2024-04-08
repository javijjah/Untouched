extends Node2D

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
