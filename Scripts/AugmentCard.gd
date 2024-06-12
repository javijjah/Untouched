extends TextureRect

@onready var augment_image = $AugmentImage
@onready var augment_title = $AugmentTitle
@onready var augment_description = $AugmentDescription
@onready var wood_hit_sword_augment_picked = $WoodHitSword_AugmentPicked
#Uses modifyAugmentCard but taking a full dictionary
func modifyCardByDict(dict):
	modifyAugmentCard(dict["Title"],dict["Description"],dict["Texture"])
#Modifies the visual part of the card, calling the 3 functions defined below
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

func selectAugment():
	wood_hit_sword_augment_picked.play()
	AugmentHolder.selectAugment(augment_title.text)
	print("Selected Augments:", AugmentHolder.activeAugments.keys())

#This makes the info only show on hover
func _on_mouse_entered():
	augment_title.show()
	augment_description.show()

func _on_mouse_exited():
	augment_title.hide()
	augment_description.hide()
