extends Control

@onready var augment_title = $AugmentTitle
@onready var augment_description = $AugmentDescription
@onready var augment_image = $AugmentImage

# Called when the node enters the scene tree for the first time.
func _ready():
	modifyAugmentCard("Bleeding Cut","Get a bonus kill when killing 2 enemies with the same weakpoint","res://AsepriteFiles/MultiPersonality.png")
	
	
	
func modifyAugmentCard(title,desc,img):
	setAugmentTitle(title)
	setAugmentDescription(desc)
	setAugmentImage(img)
func setAugmentTitle(Atitle):
	augment_title.text = Atitle

func setAugmentDescription(Adesc):
	augment_description.text = Adesc

func setAugmentImage(Aimg):
	augment_image.texture = load(Aimg)
