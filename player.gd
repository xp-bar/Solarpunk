extends CharacterBody2D

const SPEED = 20
@onready var sprite = $Sprite

var input_time: float

func _physics_process(delta) -> void:
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		input_time += delta
	else:
		input_time = 0

func handle_movement(delta) -> void:
	var direction: Vector2 = _get_direction()
	var speed = clamp(SPEED * input_time / 2, SPEED, SPEED * 1.6)
	#var speed = SPEED if input_time < 2 else SPEED * 2
	if direction:
		velocity = direction * speed
	else:
		velocity = lerp(velocity, Vector2(0, 0), 0.01)

func _get_direction() -> Vector2:
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

func is_still() -> bool:
	if velocity.x != 0:
	#if velocity.x >= 0.2 or velocity.x <= -0.2:
		return false
		
	if velocity.y >= 0.2:
		return false

	return true	
