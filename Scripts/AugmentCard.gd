extends TextureRect

@onready var augment_title = $VBoxContainer/AugmentTitle
@onready var augment_image = $VBoxContainer/AugmentImage
@onready var augment_description = $VBoxContainer/AugmentDescription
@onready var actionable_key = $VBoxContainer/ActionableKey


# Called when the node enters the scene tree for the first time.
func _ready():
	#FIXME al llegar a todos los aumentos pickeados crashea
	if AugmentHolder.AugmentList.size()==0:
		print("All augments picked")
	else:
		var augmentPicked = AugmentHolder.AugmentList[AugmentHolder.AugmentList.keys().pick_random()]
		modifyAugmentCard(augmentPicked["Title"],augmentPicked["Description"],augmentPicked["Texture"])
		actionable_key.frame = 1
	
	
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

func setActionableKey(ActionKey):
	actionable_key.frame = ActionKey

func selectAugment():
	AugmentHolder.selectAugment(augment_title.text)
	print("All augments:", AugmentHolder.AugmentList.keys())
	print("Selected Augments:", AugmentHolder.activeAugments.keys())
