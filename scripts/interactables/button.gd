extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready():
	interaction_area.interact = Callable(self, "_press_button")

func _press_button():
	audio_stream_player_2d.play()
	
	
