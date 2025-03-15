extends Control

func _ready() -> void:
	AudioControler.play_music(randi_range(0, AudioControler.playlist.size()-1))
	if AudioControler.bg_music.stream == null:
		AudioControler.play_music(0)
		
	$Option.visible = false

func _on_start() -> void:
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")


func _on_option() -> void:
	$Option.visible = true


func _on_exit() -> void:
	get_tree().quit()
