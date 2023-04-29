extends PointLight2D

@onready var status = true

func _on_timer_timeout():
	status = !status
	if status:
		color = Color.DARK_RED
	else:
		color = Color.DARK_BLUE
