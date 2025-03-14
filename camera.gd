extends Camera2D

@onready var player = $"../Player"

const SPEED = 2

func _process(delta: float) -> void:
	var direction = player._get_direction()
	var p = (direction * Vector2(80, 60))
	position = lerp(position, player.position + p, SPEED * delta)
