extends Control

@onready var augment_box = $CenterContainer2/VBoxContainer/AugmentBox
@onready var picked_marker = $CenterContainer2/PickedMarker



var augmentPicked = false
var firstAugment:TextureRect
var secondAugment:TextureRect
var thirdAugment:TextureRect
var fourthAugment:TextureRect
var augmentsPicked:Array = []
func _ready():
	loadAugments()
	picked_marker.hide()
	call_deferred("pauseScene")
func _unhandled_input(event):
	if Input.is_action_just_pressed("Continue"):
		#hideAugments()
		get_tree().paused = false
		queue_free()
	elif Input.is_action_just_pressed("UpAttack"):
		if !augmentPicked:
			firstAugment.selectAugment()
			augmentPicked = true
			picked_marker.show()
	elif Input.is_action_just_pressed("LeftAttack"):
		if !augmentPicked:
			secondAugment.selectAugment()
			augmentPicked = true
			picked_marker.show()
	elif Input.is_action_just_pressed("RightAttack"):
		if !augmentPicked:
			thirdAugment.selectAugment()
			augmentPicked = true
			picked_marker.show()

func loadAugments():
	if AugmentHolder.AugmentList.size() <= 2: #HACK
		AugmentHolder.AugmentList = AugmentHolder.BaseAugments.duplicate(true)
	for i in range(3):
		if not AugmentHolder.AugmentList.is_empty():
			print(augmentsPicked)
			augmentsPicked.insert(i,AugmentHolder.pickRandomAugment())
	if augmentsPicked.size()>=1:
		firstAugment = load("res://Scenes/AugmentCard.tscn").instantiate()
		augment_box.add_child(firstAugment)
		firstAugment.setActionableKey(0)
		firstAugment.modifyCardByDict(augmentsPicked[0])
	if augmentsPicked.size()>=2:
		secondAugment = load("res://Scenes/AugmentCard.tscn").instantiate()
		augment_box.add_child(secondAugment)
		secondAugment.setActionableKey(1)
		secondAugment.modifyCardByDict(augmentsPicked[1])
	if augmentsPicked.size()>=3:
		thirdAugment = load("res://Scenes/AugmentCard.tscn").instantiate()
		augment_box.add_child(thirdAugment)
		thirdAugment.setActionableKey(3)
		thirdAugment.modifyCardByDict(augmentsPicked[2])
#func showAugments(level):
	#loadAugments()
	#get_tree().paused = true
	#visible = true
	#augmentPicked = false

#func hideAugments():
	#for aug in augment_box.get_children():
		#augment_box.remove_child(aug)
	#visible = false
	#picked_marker.hide()
	#get_tree().paused=false
	#if !augmentPicked:
		#pass
		## TODO meter probabilidad de mejores aumentos

func pauseScene():
	get_tree().paused = true
