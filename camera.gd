extends Camera2D

@onready var player = $"../Player"

const SPEED = 1.8
const OFFSET_VECTOR: Vector2 = Vector2(40, 30)

func _physics_process(delta: float) -> void:
	var direction = player._get_direction()
	var offset = Vector2(sign(direction.x), sign(direction.y)) * OFFSET_VECTOR if player.input_time >= 0.4 else Vector2(0, 0)
	var weight = 1 - exp(-SPEED * delta)
	#position = lerp(position, player.position + offset, weight)
	position = lerp(position, Vector2(player.position.x, 90) + Vector2(offset.x, 0), weight)
