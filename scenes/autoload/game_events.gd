extends Node

signal attack(damage_amount: int)
signal enemy_through(damage_amount: int)
signal game_lost()

func emit_attack_signal(damage_amount: int):
	attack.emit(damage_amount)

func emit_enemy_through(damage_amount: int = 1):
	enemy_through.emit(damage_amount)
	
func emit_game_lost():
	game_lost.emit()
