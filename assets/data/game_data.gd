extends Node

var current_level: String = ""
var current_hp: int = 20

func _ready() -> void:
	GameEvents.enemy_through.connect(hp_decrease)

func hp_decrease(damage_amount: int):
	current_hp = max(current_hp - damage_amount, 0)
	if current_hp == 0:
		GameEvents.emit_game_lost()


func set_current_level(level: String):
	current_level = level


func level_completed(hp):
	var stars: int = 3
	var previous_stars = Data.save_data[GameData.current_level]["stars"]
	if hp > 15:
		stars = 3
	elif hp > 10:
		stars = 2
	elif hp > 5:
		stars = 1
	else:
		stars = 0
	stars = max(stars, previous_stars)
	Data.update_level(GameData.current_level, stars, true)
	Data.unlock_next_level()
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")
