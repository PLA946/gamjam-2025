extends Node

const SAVE_PATH = "user://savegame.json"

var save_data = {}

const Base_Levels = {
	"Level_1": {"name": "Pierwsze kroki", "lv": 1, "stars": 0, "waves_count": 5, "boss": false, "money": 50, "unlocked": true},
	"Level_2": {"name": "Strażnica Tatarów", "lv": 2, "stars": 0, "waves_count": 7, "boss": false, "money": 50, "unlocked": false},
	"Level_3": {"name": "Wietrzna polana", "lv": 3, "stars": 0, "waves_count": 9, "boss": false, "money": 50, "unlocked": false},
	"Level_4": {"name": "Oblężenie Lwowa", "lv": 4, "stars": 0, "waves_count": 11, "boss": false, "money": 50, "unlocked": false},
	"Level_5": {"name": "Bitwa o most", "lv": 5, "stars": 0, "waves_count": 13, "boss": false, "money": 50, "unlocked": false},
	"Level_6": {"name": "Osmański Bastion", "lv": 6, "stars": 0, "waves_count": 15, "boss": true, "money": 50, "unlocked": false},
}

func _ready():
	load_game()

func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data, "\t"))
		file.close()

func load_game():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			var content = file.get_as_text()
			var json = JSON.parse_string(content)
			if json != null:
				save_data = json
			else:
				save_data = Base_Levels.duplicate(true)
		else:
			save_data = Base_Levels.duplicate(true)
	else:
		save_data = Base_Levels.duplicate(true)
	save_game()

func restart_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string("{}")
		file.close()
	save_data = Base_Levels.duplicate(true)
	save_game()

	


func update_level(level_name: String, stars: int, unlocked: bool):
	if Data.save_data.has(level_name):
		var level_data = Data.save_data[level_name]
		level_data["stars"] = stars
		level_data["unlocked"] = unlocked
		Data.save_game()

func unlock_next_level(current_level):
	var levels = save_data.keys()

	# Wyszukaj numer aktualnego poziomu
	var current_level_number = int(current_level.split("_")[1])

	# Sprawdź, czy istnieje następny poziom
	print(current_level_number)
	var next_level = "Level_" + str(current_level_number + 1)
	print(next_level)

	if save_data.has(next_level):
		if !save_data[next_level]["unlocked"]:
			save_data[next_level]["unlocked"] = true
			save_game()  # Zapisz dane
			print("Odblokowano poziom:", next_level)
		else:
			print("Poziom", next_level, "jest już odblokowany.")
	else:
		print("Brak następnego poziomu.")
