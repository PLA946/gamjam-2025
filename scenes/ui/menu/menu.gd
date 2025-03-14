extends Control



func _on_start() -> void:
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")


func _on_option() -> void:
	print("Nie oczekuj za wiele!")


func _on_exit() -> void:
	get_tree().quit()
