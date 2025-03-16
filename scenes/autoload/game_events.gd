extends Node

signal attack(target: Entity, amount: int)
signal enemy_through()

func emit_attack_signal(target: Entity, amount: int):
	attack.emit(target, amount)

func emit_enemy_through():
	enemy_through.emit()
