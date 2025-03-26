extends Node2D


@onready var interaction_area: InteractionArea = $InteractionArea


func _ready():
	$Label.visible = !$Label.visible
	interaction_area.interact = Callable(self, "_read_sign")


func _read_sign():
	$Label.visible = !$Label.visible
	
