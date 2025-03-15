extends Control

@onready var ch1 = $PanelContainer/VBoxContainer/ModeVBoxContainer/HBoxContainer/WindowedCheckBox
@onready var ch2 = $PanelContainer/VBoxContainer/ModeVBoxContainer/HBoxContainer/MaximizedCheckBox
@onready var ch3 = $PanelContainer/VBoxContainer/ModeVBoxContainer/HBoxContainer/FullscreenCheckBox

var current_mode = DisplayServer.window_get_mode(0)

func _ready() -> void:
	if current_mode == 0:
		ch1.set_pressed(true)
	elif current_mode == 2:
		ch2.set_pressed(true)
	elif current_mode == 3:
		ch3.set_pressed(true)


func _on_x() -> void:
	$"../Option".visible = false


func _on_music(value: float) -> void:
	AudioControler.set_music_volume(value)


func _on_sfx(value: float) -> void:
	AudioControler.set_sfx_volume(value)


func _on_windowed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	ch2.set_pressed(false)
	ch3.set_pressed(false)


func _on_maximized() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	ch1.set_pressed(false)
	ch3.set_pressed(false)


func _on_fullscreen() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	ch1.set_pressed(false)
	ch2.set_pressed(false)
