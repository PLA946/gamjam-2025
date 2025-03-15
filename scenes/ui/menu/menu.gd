extends Control

func _ready() -> void:
	AudioControler.play_music()
	$Option.visible = false

func _on_start() -> void:
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")


func _on_option() -> void:
	$Option.visible = true


func _on_exit() -> void:
	get_tree().quit()
