extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var sign_label: Label = $SignLabel

@onready var label_is_showing := false

enum READING_STATES {BEGIN, READING, LAST_ONE}
var CURRENT_READING_STATE = READING_STATES.BEGIN

const BASE_TEXT_SPEED = 5
var BASE_SIGN_TEXT := ["Fuck u", "pussy", "PENIS HOLE", "RASSHØL"]
var sign_text = BASE_SIGN_TEXT.duplicate() # Copy of base sign text constant that we can fuck up and reset.
var current_text : String
var reading := false

var tween: Tween

func _ready() -> void:
	sign_label.hide()
	interactable.interact = _on_interact
	interactable.interact_name = "Read Sign"


func _process(delta: float) -> void:
	match CURRENT_READING_STATE:
		READING_STATES.BEGIN: interactable.interact_name = "Read Sign"
		READING_STATES.READING: interactable.interact_name = "Next..."
		READING_STATES.LAST_ONE: interactable.interact_name = "Finish"

# INTERACTABLE.INTERACT - CALLABLE OVERRIDE
# -----------------------------------------------------
func _on_interact():
	if sign_text.size() == 1:
		CURRENT_READING_STATE = READING_STATES.LAST_ONE
	elif sign_text.size() > 1:
		CURRENT_READING_STATE = READING_STATES.READING
	else:
		CURRENT_READING_STATE = READING_STATES.BEGIN
		
	if sign_text:	
		current_text = sign_text.pop_front()
		sign_label.text = ""
		
		sign_label.show()
		
		var tween := create_tween()
		tween.tween_property(sign_label,"text", current_text, (BASE_TEXT_SPEED * (1.0 / len(current_text))))
		await tween.finished
		tween.stop()
		
	else:
		sign_label.hide()
		sign_text = BASE_SIGN_TEXT.duplicate()
# -----------------------------------------------------
