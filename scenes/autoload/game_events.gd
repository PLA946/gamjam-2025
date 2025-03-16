extends Node

signal attack(damage_amount: int)
signal enemy_through(damage_amount: int)
signal enemy_down()
signal game_lost()
signal change_level_hover()
signal level_victory()

func emit_attack_signal(damage_amount: int):
	attack.emit(damage_amount)

func emit_enemy_through(damage_amount: int = 1):
	enemy_through.emit(damage_amount)
	
func emit_game_lost():
	game_lost.emit()
	
func emit_enemy_down():
	enemy_down.emit()

func emit_change_level_hover():
	change_level_hover.emit()

func emit_level_victory():
	level_victory.emit()
