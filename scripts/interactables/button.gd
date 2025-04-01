extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("player")

func _ready() -> void:
	interactable.interact = _on_interact
	animated_sprite_2d.visible = false

# INTERACTABLE.INTERACT - CALLABLE OVERRIDE
# -----------------------------------------------------
func _on_interact():
	"""
	Interactable Nodes Callable function override:
		On button interact -> Play explosion sound fx and play explosion vfx
	"""
	
	audio_stream_player_2d.play()
	
	animated_sprite_2d.visible = true
	animated_sprite_2d.play("default")
	await animated_sprite_2d.animation_finished
	animated_sprite_2d.visible = false
	
	await get_tree().create_timer(1).timeout
	player.die()
# -----------------------------------------------------
