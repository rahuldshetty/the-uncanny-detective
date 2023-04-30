extends Node2D

signal dialogue(name, message)

var cannot_leave_messages = [
	"I cannot leave without solving this case.",
	"I cannot leave at this moment.",
	"There is a case that requires my brain power.",
	"I shouldn't be slacking off.",
	"I better check out the crime scene.",
]

func _on_area_2d_body_entered(body):
	if  body.is_in_group("player"):
		randomize()
		dialogue.emit("Detective", 
			cannot_leave_messages.pick_random()
		)


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		dialogue.emit("Detective", "")
