extends Node2D
class_name Entity

@export var entity_name: String = ""
@export var hp: int
@export var damage: int
@export var speed: int = 20
@export var time_to_attack: int = 1
@export var gold_drop: int

func _ready() -> void:
	#GameEvents.attack.connect(receive_damage)
	$HealthBar/ProgressBar.max_value = hp
	$HealthBar/ProgressBar.value = hp
	tree_exited.connect(died)


func receive_damage(damage_amount: int):
	hp = max(hp - damage_amount, 0)
	$HealthBar/ProgressBar.value = hp
	if hp == 0:
		queue_free()


func died():
	if is_in_group("enemy"):
		GameEvents.emit_enemy_down()
		Data.save_data[GameData.current_level]["money"] += gold_drop
		GameEvents.emit_update_overlay(GameData.current_level)
