extends StaticBody2D

signal dialogue(name, message)

@export var talkable = true


# Cop Dialog
var dialog_spoken = 0
@export var initial_prompts:  Array[String] = []
@export var already_said_prompt = ""

@onready var officer_message = $OfficerVision/OfficerMessage

func _ready():
	officer_message.visible = false
	officer_message.rotation -= rotation

func _on_officer_vision_body_entered(body):
	if talkable and body.is_in_group("player"):
		officer_message.visible = true

func _on_officer_vision_body_exited(body):
	if body.is_in_group("player"):
		officer_message.visible = false
		dialogue.emit("", "")

func _on_player_interact():
	if officer_message.visible and dialog_spoken < len(initial_prompts):
		dialogue.emit("Cop", initial_prompts[dialog_spoken])
		dialog_spoken += 1
	elif officer_message.visible:
		dialogue.emit("Cop", already_said_prompt)
