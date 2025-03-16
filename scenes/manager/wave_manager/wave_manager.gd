extends Node

var enemies = [preload("res://scenes/entities/enemies/enemy_1/enemy_1.tscn")]
@export var waves: Waves
var full_waves_list: Array[Array] = []
var wave_num: int
#@onready var paths = ["Path2D_1", ]
var current_path = 0

func _ready() -> void:
	get_parent().wave_start.connect(wave_start)
	$Timer.timeout.connect(next_spawn)
	for wave in range(len(waves.waves)):
		var current_wave = []
		for id in (waves.waves[wave] as Dictionary).keys():
			for amount in range(waves.waves[wave][id]):
				current_wave.append(id)
		full_waves_list.append(current_wave)
	
	if len(full_waves_list) == 0:
		push_error("empty waves list for %s" % get_parent().get_name())

func wave_start(num: int):
	wave_num = num
	
	if len(full_waves_list[num]) > 0:
		$Timer.one_shot = false
		$Timer.start()
	

func next_spawn():
	if len(full_waves_list[wave_num]) > 0:
		var path_follow: PathFollow2D = PathFollow2D.new()
		path_follow.loop = false
		path_follow.rotates = false
		path_follow.add_child((enemies[full_waves_list[wave_num][0]] as PackedScene).instantiate())
		get_parent().get_tree().get_nodes_in_group("path")[current_path].add_child(path_follow)
		full_waves_list[wave_num].pop_back()
		current_path = int(!bool(current_path))

	if len(full_waves_list[wave_num]) == 0:
		$Timer.one_shot = true
		$Timer.stop()
