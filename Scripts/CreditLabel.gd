extends RichTextLabel
func _ready():
	connect("meta_clicked", meta_clicked)
func meta_clicked(meta):
	OS.shell_open(meta)
