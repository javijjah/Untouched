extends TextureRect

@onready var augment_image = $AugmentImage
@onready var augment_title = $AugmentTitle
@onready var augment_description = $AugmentDescription
@onready var wood_hit_sword_augment_picked = $WoodHitSword_AugmentPicked
# TODO raya del tema al pulsar
# TODO editar el main theme para que esté loopeado


# Called when the node enters the scene tree for the first time.

func modifyCardByDict(dict):
	modifyAugmentCard(dict["Title"],dict["Description"],dict["Texture"])
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

#func setActionableKey(ActionKey):
	#actionable_key.frame = ActionKey

func selectAugment():
	wood_hit_sword_augment_picked.play()
	AugmentHolder.selectAugment(augment_title.text)
	print("Selected Augments:", AugmentHolder.activeAugments.keys())


func _on_mouse_entered():
	augment_title.show()
	augment_description.show()

func _on_mouse_exited():
	augment_title.hide()
	augment_description.hide()
