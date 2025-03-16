extends Node

var current_lock: Entity
var is_locked: bool = false
var enemies_in_range: Array[Entity]

@onready var detection_area: Area2D = get_parent().get_node("Area2D")

func _ready() -> void:
	detection_area.area_entered.connect(enemy_detected)
	detection_area.area_exited.connect(enemy_left)
	$Timer.wait_time = get_parent().time_to_attack
	$Timer.timeout.connect(attack)


func enemy_detected(area: Area2D):
	enemies_in_range.append(area.get_parent())
	if $Timer.is_stopped():
		$Timer.start()


func enemy_left(area: Area2D):
	enemies_in_range.erase(area.get_parent())
	if len(enemies_in_range) == 0:
		$Timer.stop()

func attack():
	if len(enemies_in_range) > 0:
		if len(enemies_in_range) > 1:
			enemies_in_range.sort_custom(func(a: Entity, b: Entity):
				var a_progress = a.get_parent().progress_ratio
				var b_progress = b.get_parent().progress_ratio
				return a_progress > b_progress
			)
		
		var projectile = (get_parent().projectile.instantiate() as Node2D)
		get_parent().add_child(projectile)
		projectile.global_position = get_parent().global_position
		var rotation = (enemies_in_range[0].global_position - get_parent().global_position).angle()
		projectile.rotation = rotation
		if get_parent().is_in_group("rotatable"):
			get_parent().rotation = rotation
		projectile.fly_to(enemies_in_range[0])
		
	
