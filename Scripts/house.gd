extends StaticBody2D

@onready var label = $Area2D/Label

func _ready():
	label.visible = false

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		label.visible = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		label.visible = false


func _on_player_interact():
	if label.visible:
		# enter house
		pass
