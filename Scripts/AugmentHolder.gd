extends Node2D

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
	#"Cool Hat":{ #TODO
		#"Title": "Cool Hat",
		#"Texture": "res://Assets/UI/Augments/AugmentSprites/hat.png",
		#"Description": "Gives you a cool hat"
	#},
	#"Angel Shield":{
		#"Title": "Angel Shield",
		#"Texture": "res://Assets/UI/Augments/AugmentSprites/auraAug.png",
		#"Description": "Saves you from death every 20 kills"
	#},
		#"Slow Down":{
		#"Title": "Slow Down",
		#"Texture": "res://Assets/UI/Augments/AugmentSprites/permanent slowDown.png",
		#"Description": "Slows enemies down a bit"
	#}
	"Sword Sharpening":{
		"Title": "Sword Sharpening",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/parry.png",
		"Description": "Get some attack speed"
	},
	"Penetrative Hit":{
		"Title": "Penetrative Hit",
		"Texture": "res://Assets/UI/Augments/AugmentSprites/penHit.png",
		"Description": "Chance of hitting an enemy even if missing the weakpoint "
	},
	"Shrooms":{
		"Title": "Shrooms",
		"Texture": "res://Assets/UI/Augments/shrooms.png",
		"Description": "WHAT HAVE YOU EATEN"
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
