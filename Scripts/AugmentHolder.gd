extends Node2D
#Augments that won't be modified throughout the game
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
#Used to manage Augments with exclusivity
var AugmentList = BaseAugments.duplicate(true)
#The augments the player currently has
var activeAugments = {
	 
}
#Returns a Dictionary from the key given
func pickAugment(key) -> Dictionary:
	var augment = AugmentList[key]
	AugmentList.erase(key)
	return augment
#Reseting all augmentsList
func reset():
	AugmentList = AugmentList
	activeAugments.clear()

#Picks a random Augment
func pickRandomAugment():
	if AugmentList.size()>0:
		return pickAugment(AugmentList.keys().pick_random())

#Select an augment an adds it to the list
func selectAugment(key):
	activeAugments[key] = BaseAugments[key]
	WorldGlobalVariables.augmentObtained.emit(activeAugments[key])
