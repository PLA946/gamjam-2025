extends Node2D

var current_level: String = ""
signal wave_start(num: int)
var current_wave = 0
var wave_started = false

func _ready() -> void:
	current_level = get_name()
	var overlay = load("res://scenes/ui/overlay/overlay.tscn").instantiate()
	$Overlay.add_child(overlay) 
	overlay.update_data(current_level)
	GameData.set_current_level(get_name())
	GameEvents.enemy_down.connect(enemy_down)

func _on_wave_start() -> void:
	$WaveStart.visible = false
	wave_start.emit(current_wave)
	current_wave += 1
	wave_started = true

func enemy_down():
	if len(get_tree().get_nodes_in_group("enemy")) == 0:
		wave_started = false
		$WaveStart.visible = true
		if current_wave == Data.save_data[current_level]["waves_count"]:
			GameEvents.emit_level_victory()
