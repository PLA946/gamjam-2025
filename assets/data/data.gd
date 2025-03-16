extends Node

const SAVE_PATH = "res://assets/data/savegame.json"

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
		file.store_string(JSON.stringify(save_data, "\t"))  # Pretty print
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
				save_data = Base_Levels.duplicate(true)  # Kopiuje domyślne wartości
		else:
			save_data = Base_Levels.duplicate(true)
	else:
		save_data = Base_Levels.duplicate(true)
	save_game()


func update_level(level_name: String, stars: int, unlocked: bool):
	if Data.save_data.has(level_name):  # Sprawdzamy, czy poziom istnieje w danych
		var level_data = Data.save_data[level_name]
		level_data["stars"] = stars  # Zapisujemy liczbę gwiazdek
		level_data["unlocked"] = unlocked  # Zmieniamy status odblokowania
		Data.save_game()  # Zapisz dane gry do pliku
		print("Poziom %s został zaktualizowany! Gwiazdki: %d, Odblokowany: %s" % [level_name, stars, unlocked])


func unlock_next_level():
	# Pobierz klucze poziomów
	var levels = save_data.keys()

	# Zidentyfikuj aktualny poziom
	var current_level = null
	for level in levels:
		if save_data[level]["unlocked"]:
			current_level = level
			break  # Znaleziono pierwszy odblokowany poziom

	if current_level == null:
		print("Brak odblokowanego poziomu.")
		return

	# Wyszukaj kolejny poziom
	var current_level_number = int(current_level.split("_")[1])
	var next_level = "Level_" + str(current_level_number + 1)

	# Sprawdź, czy istnieje następny poziom i czy nie jest już odblokowany
	if save_data.has(next_level) and !save_data[next_level]["unlocked"]:
		save_data[next_level]["unlocked"] = true
		save_game()  # Zapisz dane
		print("Odblokowano poziom:", next_level)
	else:
		print("Brak następnego poziomu lub już jest odblokowany.")
