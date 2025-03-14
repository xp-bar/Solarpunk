extends CharacterBody2D

const SPEED = 80
@onready var sprite = $Sprite

func _apply_gravity(delta) -> void:
	velocity += get_gravity() / 36 * delta

func handle_movement(delta) -> void:
	var direction: Vector2 = _get_direction()
	velocity = direction * SPEED * delta

func _get_direction() -> Vector2:
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

func is_still() -> bool:
	if velocity.x != 0:
	#if velocity.x >= 0.2 or velocity.x <= -0.2:
		return false
		
	if velocity.y >= 0.2:
		return false

	return true	
