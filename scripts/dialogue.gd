extends CanvasLayer

func _ready():
	var dialogue = get_node_or_null("DialoguePlayer")
	$NinePatchRect/RichTextLabel.text = "Cameron"
	$NinePatchRect/RichTextLabel2.text = "Hello world"
