extends Control

@onready var wave = $View/VBoxContainer/PanelContainer3/HBoxContainer/Label
@onready var heart = $View/VBoxContainer/HBoxContainer/PanelContainer/HBoxContainer/Label
@onready var money = $View/VBoxContainer/HBoxContainer/PanelContainer2/HBoxContainer2/Label
@onready var pause = $Pause

var hp: int = 20
var current_wave: int = 0
var levels = Data.save_data

func _ready() -> void:
	pause.visible = false

func _on_resume() -> void:
	pause.visible = false
	Data.unlock_next_level()
	GameData.level_completed(hp)
	

func _on_quit() -> void:
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")
	

func _on_pause() -> void:
	pause.visible = true


func update_data(level_key: String):
	if levels.has(level_key):
		var level = levels[level_key]
		wave.text = "Fale: %d/%d" % [current_wave, level["waves_count"]]
		heart.text = str(hp)
		money.text = str(level["money"])
