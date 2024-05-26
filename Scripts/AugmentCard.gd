extends TextureRect

@onready var augment_title = $VBoxContainer/AugmentTitle
@onready var augment_image = $VBoxContainer/AugmentImage
@onready var augment_description = $VBoxContainer/AugmentDescription
@onready var actionable_key = $VBoxContainer/ActionableKey
#TODO augment screen teclas
#TODO colores sprites teclado
#TODO raya del tema al pulsar
#TODO reworkear GUI augmentScreen
# TODO editar el main theme para que esté loopeado
# TODO secuencia inicial
# TODO lista de highscores
# TODO otro enemigo
# TODO reworkear dificultad
# TODO opciones y créditos
# TODO mayúsculas ficheros proyecto
 #TODO GUI para ver progreso de los aumentos con efecto pasivo
#FIXME bug enemigo que desaparece
# depTODO cámara de movimiento ágil, que se mueva el jugador o fakearlo al menos
@onready var wood_hit_sword_augment_picked = $WoodHitSword_AugmentPicked

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#if AugmentHolder.AugmentList.size()==0:
		#print("All augments picked")
	#else:
		#var augmentPicked = AugmentHolder.pickRandomAugment()
		#modifyAugmentCard(augmentPicked["Title"],augmentPicked["Description"],augmentPicked["Texture"])
		#actionable_key.frame = 1
	#
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

func setActionableKey(ActionKey):
	actionable_key.frame = ActionKey

func selectAugment():
	wood_hit_sword_augment_picked.play()
	AugmentHolder.selectAugment(augment_title.text)
	print("Selected Augments:", AugmentHolder.activeAugments.keys())
