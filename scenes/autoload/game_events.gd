extends Node

signal attack(target: Entity, amount: int)


func emit_attack_signal(target: Entity, amount: int):
	attack.emit(target, amount)
