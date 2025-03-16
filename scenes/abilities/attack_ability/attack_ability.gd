extends Node

var detectionArea: Area2D

func _ready() -> void:
	detectionArea = get_parent().get_node("Area2D")
	#detectionArea.area_entered.connect(attack)
	#
#func attack(target: Area2D):
	#print(target.owner)
	#if target.owner == Entity:
		#GameEvents.emit_attack_signal(target.owner, (get_parent() as Entity).damage)
