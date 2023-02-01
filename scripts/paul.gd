extends Node

func _ready():
	$AnimationPlayer.play("idle")


func _on_Area2D_body_entered(body):
	print("fuck yeah")
	var dialogue = get_node_or_null("DialoguePlayer")
	print("shit yeah")
