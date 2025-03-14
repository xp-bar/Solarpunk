extends CharacterBody2D

const SPEED = 100
@onready var sprite = $Sprite

func handle_movement() -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 100)
		
	move_and_slide()
