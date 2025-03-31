extends Node2D


@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sign_label = $Label
@onready var showing_text = false


# VARIABLE FOR SIGN TEXT
var sign_text = "Fuck u"

func _ready():
	sign_label.hide()
	interaction_area.interact = Callable(self, "_read_sign")
	sign_label.text = sign_text

func _read_sign():
	if not showing_text:
		sign_label.show()
		showing_text = true
	else:
		sign_label.hide()
		showing_text = false
