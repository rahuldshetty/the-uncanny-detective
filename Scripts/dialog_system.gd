extends CanvasLayer

@onready var _dialog = $"."
@onready var _name = $Panel/NameLabel
@onready var _message = $Panel/MessageLabel

func _ready():
	_dialog.visible = false

func handle_message(name, message):
	if message == "":
		_dialog.visible = false
	else:
		_dialog.visible = true
		_name.text = name + ":"
		_message.text = message


func _on_officer_dialogue(name, message):
	handle_message(name, message)


func _on_officer_2_dialogue(name, message):
	handle_message(name, message)
