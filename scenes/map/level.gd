extends Node2D

var current_level: String = ""

func _ready() -> void:
	current_level = get_name()
	var overlay = load("res://scenes/ui/overlay/overlay.tscn").instantiate()
	$Overlay.add_child(overlay) 
	overlay.update_data(current_level)
	GameData.set_current_level(get_name())
