extends StateMachine

func _ready() -> void:
	states = ['idle', 'flying']
	call_deferred('set_state', 'idle')

func _state_logic(delta) -> void:
	match state:
		'flying':
			parent.handle_movement()
	pass
	
func _get_transition(delta):
	var direction := Input.get_axis("ui_left", "ui_right")
	match state:
		'flying':
			if not parent.velocity.x >= 0.2 and not parent.velocity.x <= -0.2:
				return 'idle'
		'idle':
			if direction:
				return 'flying'
	
func _enter_state(newState, oldState) -> void:
	match newState:
		'idle':
			parent.sprite.play('idle')

func _exit_state(oldState, newState) -> void:
	pass
