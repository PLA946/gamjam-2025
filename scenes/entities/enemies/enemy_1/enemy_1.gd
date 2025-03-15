extends Entity

func _process(delta: float) -> void:
	(get_parent() as PathFollow2D).progress = (get_parent().progress+(speed*delta))
