extends StateMachine

func _ready() -> void:
	states = ['idle', 'flying']
	call_deferred('set_state', 'idle')

func _state_logic(delta) -> void:
	print_debug(state)
	match state:
		'idle':
			parent.handle_movement(delta)
		'flying':
			parent.handle_movement(delta)

	parent.move_and_slide()
	
func _get_transition(delta):
	var direction: Vector2 = parent._get_direction()
	match state:
		'flying':
			if parent.is_still():
				return 'idle'
			if parent.is_on_floor():
				return 'landed'
		'landed':
			if direction.y >= 0:
				return 'flying'
		'idle':
			if direction:
				return 'flying'


	
func _enter_state(newState, oldState) -> void:
	var direction: Vector2 = parent._get_direction()

	match newState:
		'idle':
			parent.sprite.play('idle')
		'flying':
			if direction.x > 0:
				parent.sprite.flip_h = true
			elif direction.x < 0:
				parent.sprite.flip_h = false

func _exit_state(oldState, newState) -> void:
	pass
