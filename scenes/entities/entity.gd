extends Node2D
class_name Entity

@export var entity_name: String = ""
@export var hp: int
@export var damage: int
@export var speed: int = 20
@export var time_to_attack: int = 1

func _ready() -> void:
	GameEvents.attack.connect(receive_damage)


func receive_damage(target: Entity, amount: int):
	hp = max(hp, 0)
	if hp == 0:
		queue_free()
		
