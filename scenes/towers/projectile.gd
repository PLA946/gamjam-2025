extends CharacterBody2D

var target_entity: Entity
var last_direction = Vector2.ZERO

func _ready() -> void:
	$Area2D.area_entered.connect(enemy_hit)
	$Area2D.area_exited.connect(area_left)

func _process(delta: float) -> void:
	if target_entity != null:
		last_direction = (target_entity.global_position - global_position).normalized()

	velocity = last_direction * get_parent().projectile_speed
	rotation = last_direction.angle()
	move_and_slide()

func enemy_hit(area: Area2D):
	if area.get_parent().is_in_group("enemy"):
		area.get_parent().receive_damage(get_parent().damage)
		queue_free()
	
func area_left(area: Area2D):
	if area.get_parent().is_in_group("tower"):
		queue_free()

func fly_to(target: Entity):
	target_entity = target
