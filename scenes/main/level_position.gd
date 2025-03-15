extends Control

var data = load("res://assets/data/data.gd")
var levels = data.Levels

@onready var tooltip_label = $TooltipLabel

func _process(delta):
	if tooltip_label.visible:
		tooltip_label.global_position = get_global_mouse_position() + Vector2(30, 30)


func _ready():
	tooltip_label.visible = false
	var scene = load("res://scenes/main/bg_map.tscn")  # Ścieżka do sceny
	var instance = scene.instantiate()
	$"../Background".add_child(instance)


func _on_level_ex():
	tooltip_label.visible = false


func _on_level_me1():
	_update_tooltip("Level_1")
	tooltip_label.visible = true
	tooltip_label.global_position = get_global_mouse_position() + Vector2(30, 30)

func _on_level_me2():
	_update_tooltip("Level_2")
	tooltip_label.visible = true
	tooltip_label.global_position = get_global_mouse_position() + Vector2(30, 30)

func _on_level_me3():
	_update_tooltip("Level_3")
	tooltip_label.visible = true
	tooltip_label.global_position = get_global_mouse_position() + Vector2(30, 30)

func _on_level_me4():
	_update_tooltip("Level_4")
	tooltip_label.visible = true
	tooltip_label.global_position = get_global_mouse_position() + Vector2(30, 30)

func _on_level_me5():
	_update_tooltip("Level_5")
	tooltip_label.visible = true
	tooltip_label.global_position = get_global_mouse_position() + Vector2(30, 30)

func _on_level_me6():
	_update_tooltip("Level_6")
	tooltip_label.visible = true
	tooltip_label.global_position = get_global_mouse_position() + Vector2(30, 30)


func _on_level_1():
	get_tree().change_scene_to_file("res://scenes/map/level_1.tscn")

func _on_level_2():
	get_tree().change_scene_to_file("res://scenes/map/level_2.tscn")

func _on_level_3():
	get_tree().change_scene_to_file("res://scenes/map/level_2.tscn")

func _on_level_4():
	get_tree().change_scene_to_file("res://scenes/map/level_2.tscn")

func _on_level_5():
	get_tree().change_scene_to_file("res://scenes/map/level_2.tscn")

func _on_level_6():
	get_tree().change_scene_to_file("res://scenes/map/level_2.tscn")



func _update_tooltip(level_name: String):
	if levels.has(level_name):
		var level_data = levels[level_name]
		tooltip_label.text = str(level_data.name) + "\nPoziom: " + str(level_data.lv) + "\nGwiazdki: " + str(level_data.stars) + "\nFale: " + str(level_data.waves_count)
	tooltip_label.visible = true
