extends Entity

func _process(delta: float) -> void:
	get_parent().progress = (get_parent().progress+(speed*delta))
	if get_parent().progress_ratio == 1:
		GameEvents.emit_enemy_through()
		queue_free()
