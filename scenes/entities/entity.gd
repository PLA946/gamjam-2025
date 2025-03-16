extends Node2D
class_name Entity

@export var entity_name: String = ""
@export var hp: int
@export var damage: int
@export var speed: int = 20
@export var time_to_attack: int = 1

func _ready() -> void:
	#GameEvents.attack.connect(receive_damage)
	$HealthBar/ProgressBar.max_value = hp
	$HealthBar/ProgressBar.value = hp
	pass


func receive_damage(damage_amount: int):
	hp = max(hp - damage_amount, 0)
	$HealthBar/ProgressBar.value = hp
	if hp == 0:
		queue_free()
		
