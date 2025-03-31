extends Node2D


@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sign_label = $Label
@onready var showing_text = false

signal stop_reading


# VARIABLE FOR SIGN TEXT
var sign_text = "Fuck u"

func _ready():
	sign_label.hide()
	interaction_area.interact = Callable(self, "_read_sign")

func _read_sign():
	if not showing_text:	
		sign_label.text = sign_text
		sign_label.show()
		showing_text = true
	else:
		sign_label.hide()
		showing_text = false
	await stop_reading

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		stop_reading.emit()
