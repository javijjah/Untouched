extends RichTextLabel
#This script opens the webs of the links to the assets in the credits
func _ready():
	connect("meta_clicked", meta_clicked)
func meta_clicked(meta):
	OS.shell_open(meta)

