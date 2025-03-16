extends Control

@onready var tooltip_label = $TooltipLabel
@onready var level_buttons = {
	"Level_1": $Level_1, 
	"Level_2": $Level_2, 
	"Level_3": $Level_3, 
	"Level_4": $Level_4, 
	"Level_5": $Level_5, 
	"Level_6": $Level_6
}
@onready var level_paths = {
	"Level_1": $Background/BgMap/BaseBackground/Path/Path1, 
	"Level_2": $Background/BgMap/BaseBackground/Path/Path2, 
	"Level_3": $Background/BgMap/BaseBackground/Path/Path3, 
	"Level_4": $Background/BgMap/BaseBackground/Path/Path4, 
	"Level_5": $Background/BgMap/BaseBackground/Path/Path5, 
	"Level_6": $Background/BgMap/BaseBackground/Path/Path6,
}

var levels = Data.save_data

func _process(delta):
	if tooltip_label.visible:
		tooltip_label.global_position = get_global_mouse_position() + Vector2(30, 30)


func _ready():
	tooltip_label.visible = false
	var scene = load("res://scenes/main/bg_map.tscn")
	var instance = scene.instantiate()
	$"../Background".add_child(instance)

	await get_tree().process_frame
	Data.load_game()
	_find_paths()  # Pobierz ścieżki po załadowaniu
	_update_level_visibility()

func _find_paths():
	# Pobierz nowo załadowane ścieżki z dodanej sceny
	var bg_map = $"../Background/BgMap"
	if bg_map:
		var path_parent = bg_map.get_node("BaseBackground/Path")
		if path_parent:
			level_paths = {
				"Level_1": path_parent.get_node_or_null("Path1"),
				"Level_2": path_parent.get_node_or_null("Path2"),
				"Level_3": path_parent.get_node_or_null("Path3"),
				"Level_4": path_parent.get_node_or_null("Path4"),
				"Level_5": path_parent.get_node_or_null("Path5"),
				"Level_6": path_parent.get_node_or_null("Path6"),
			}


func _update_level_visibility():
	for level in level_buttons.keys():
		if level_buttons[level] and level_paths[level]:  # Sprawdzamy, czy obiekty istnieją
			level_buttons[level].visible = Data.save_data[level]["unlocked"]
			level_paths[level].visible = Data.save_data[level]["unlocked"]
		else:
			print("Błąd: Nie znaleziono przycisku lub ścieżki dla", level)


func _update_tooltip(level_name: String):
	if levels.has(level_name):
		var level_data = levels[level_name]
		tooltip_label.text = str(level_data.name) + "\nPoziom: " + str(level_data.lv) + "\nGwiazdki: " + str(level_data.stars) + "\nFale: " + str(level_data.waves_count)
	tooltip_label.visible = true


func _on_level_ex():
	tooltip_label.visible = false


func _on_level_me1():
	_update_tooltip("Level_1")
	tooltip_label.visible = true

func _on_level_me2():
	_update_tooltip("Level_2")
	tooltip_label.visible = true

func _on_level_me3():
	_update_tooltip("Level_3")
	tooltip_label.visible = true

func _on_level_me4():
	_update_tooltip("Level_4")
	tooltip_label.visible = true

func _on_level_me5():
	_update_tooltip("Level_5")
	tooltip_label.visible = true

func _on_level_me6():
	_update_tooltip("Level_6")
	tooltip_label.visible = true



func _on_level_1():
	start_level("Level_1")

func _on_level_2():
	start_level("Level_2")

func _on_level_3():
	start_level("Level_3")

func _on_level_4():
	start_level("Level_4")

func _on_level_5():
	start_level("Level_5")

func _on_level_6():
	start_level("Level_6")

func start_level(level_name: String):
	get_tree().change_scene_to_file("res://scenes/map/%s.tscn" % level_name)
