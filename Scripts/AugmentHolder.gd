extends Node2D
# TODO revisión: hacer que el samurai se mueva
# TODO fijar el game breaking
# TODO cámara de movimiento ágil, que se mueva el jugador o fakearlo al menos
# TODO editar el main theme para que esté loopeado

var BaseAugments = {
	"Random Augment":{
		"Title": "Random Augment",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/RandomAug.png",
		"Description": "Gets a Random Augment"
	},
	"Bleeding Cut":{
		"Title": "Bleeding Cut",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/scrollItest.png",
		"Description": "Get a bonus kill when killing 5 enemies without missing an attack"
	},
	"Thick Skin":{ 
		"Title": "Thick Skin",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/ChanceToSurviveAug.png",
		"Description": "You have a chance of surviving a hit"
	},
	"Cool Hat":{
		"Title": "Cool Hat",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/hat.png",
		"Description": "Gives you a cool hat"
	},
	"Crystal Ball":{
		"Title": "Crystal Ball",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/seeTheFutureAug.png",
		"Description": "Take a peek at your 3 next Augment Pages"
	},
	"Angel Shield":{
		"Title": "Angel Shield",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/auraAug.png",
		"Description": "Saves you from death every 20 kills"
	},
	"Sword Sharpening":{
		"Title": "Sword Sharpening",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/parry.png",
		"Description": "Get some attack speed"
	},
	"Ouroboros":{
		"Title": "Ouroboros",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/ouroboros.png",
		"Description": "You can get all augments again"
	}
	}
var AugmentList = BaseAugments.duplicate(true)
var activeAugments = {
	 
}
func pickAugment(key) -> Dictionary:
	var augment = AugmentList[key]
	AugmentList.erase(key)
	return augment
func reset():
	AugmentList = AugmentList
	activeAugments.clear()

func pickRandomAugment():
	if AugmentList.size()>0:
		return pickAugment(AugmentList.keys().pick_random())
		#return  AugmentList[AugmentList.keys().pick_random()]

func selectAugment(key):
	activeAugments[key] = BaseAugments[key]
	WorldGlobalVariables.augmentObtained.emit(activeAugments[key])
