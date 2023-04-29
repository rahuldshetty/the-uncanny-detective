extends StaticBody2D

@onready var siren_sound = $Siren
@onready var siren_message = $Siren/Area2D/SirenMessage

@onready var radio_sound = $Radio
@onready var radio_message = $Radio/RadioArea/RadioMessage

var siren_ringing
var radio_power_on

func set_siren_state(status):
	siren_ringing = status
	if status:
		siren_sound.play()
		siren_message.text = "(E) Turn Off Siren"
	else:
		siren_sound.stop()
		siren_message.text = "(E) Turn On Siren"

func set_radio_state(status):
	radio_power_on = status
	if status:
		radio_sound.play()
		radio_message.text = "(E) Turn Off Police Radio"
	else:
		radio_sound.stop()
		radio_message.text = "(E) Turn On Police Radio"
	
func _ready():
	siren_sound.play()
	siren_message.visible = false
	siren_message.rotation -= rotation
	set_siren_state(true)
	
	# Radoio events
	radio_power_on = true
	radio_message.visible = false
	radio_message.rotation -= rotation
	set_radio_state(true)

func _on_area_2d_body_entered(body:Node2D):
	if body.is_in_group("player"):
		siren_message.visible = true

func _on_area_2d_body_exited(body:Node2D):
	if body.is_in_group("player"):
		siren_message.visible = false


func _on_player_interact():
	# player in the area and siren ringing
	if siren_ringing and siren_message.visible:
		set_siren_state(false)
	elif not siren_ringing and siren_message.visible:
		set_siren_state(true)

	# player in the area and radio ringing
	if radio_power_on and radio_message.visible:
		set_radio_state(false)
	elif not radio_power_on and radio_message.visible:
		set_radio_state(true)


func _on_radio_area_body_entered(body):
	if body.is_in_group("player"):
		radio_message.visible = true


func _on_radio_area_body_exited(body):
	if body.is_in_group("player"):
		radio_message.visible = false
