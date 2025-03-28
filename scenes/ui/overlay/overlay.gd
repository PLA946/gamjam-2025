extends Control

@onready var wave = $View/VBoxContainer/PanelContainer3/HBoxContainer/Label
@onready var heart = $View/VBoxContainer/HBoxContainer/PanelContainer/HBoxContainer/Label
@onready var money = $View/VBoxContainer/HBoxContainer/PanelContainer2/HBoxContainer2/Label
@onready var pause = $Pause

var hp: int = GameData.current_hp
var current_wave: int = 0
var levels = Data.save_data

func _ready() -> void:
	GameEvents.enemy_through.connect(call_update)
	GameEvents.update_overlay.connect(call_update)
	GameEvents.level_victory.connect(on_victory)
	GameEvents.game_lost.connect(on_lose)
	GameEvents.wave_change.connect(wave_change)

func _on_resume() -> void:
	pause.visible = false
	get_tree().paused = false
	#on_victory()

func _on_quit() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")


func _on_pause() -> void:
	pause.visible = true
	get_tree().paused = true

func call_update(__):
	hp = GameData.current_hp
	update_data(GameData.current_level)

func update_data(level_key: String):
	if levels.has(level_key):
		var level = levels[level_key]
		wave.text = "Fale: %d/%d" % [current_wave, level["waves_count"]]
		heart.text = str(hp)
		money.text = str(level["money"])

func _on_back_menu() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/menu/menu.tscn")

func _on_reset() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func on_lose():
	$Lose.visible = true

func on_victory():
	GameData.level_completed(hp)

func wave_change(num: int):
	current_wave = num
	update_data(GameData.current_level)
