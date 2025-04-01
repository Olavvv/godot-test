extends Control




func _on_resume_button_pressed() -> void:
	
	"""
	The method of changing scenes wont work for resume button,
	will have to keep the "level" scene loaded while this menu scene is as well.
	"""
	
	pass


func _on_back_to_mm_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/menu.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
