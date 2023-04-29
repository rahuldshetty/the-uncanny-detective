extends CharacterBody2D

signal interact

@export var speed = 89
@export var rotation_speed = 1.65

@onready var footstep_fx : AudioStreamPlayer2D = $FootstepSound
@onready var footstep_fx_playing = false

var rotation_direction = 0

func handle_footsteps(velocity):
	if not footstep_fx_playing and velocity.length() > 0:
		footstep_fx_playing = true
		footstep_fx.play()
	elif footstep_fx_playing and velocity.length() == 0:
		footstep_fx_playing = false
		footstep_fx.stop()

func get_input():
	rotation_direction = Input.get_axis("ui_left", "ui_right")
	velocity = transform.x * Input.get_axis("ui_down", "ui_up") * speed

func _input(event):
	if Input.is_key_pressed(KEY_E):
		emit_signal("interact")

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	handle_footsteps(velocity)
