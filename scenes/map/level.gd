extends Node2D


func _ready() -> void:
	var scene = load("res://scenes/ui/overlay/overlay.tscn")
	var overlay = scene.instantiate()
	$Overlay.add_child(overlay) 
	overlay.update_data(get_name())
