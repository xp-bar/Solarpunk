extends Node

class_name StateMachine

var state = null
var previousState = null
var states = []

@onready var parent: Node2D = get_parent()

func _physics_process(delta: float) -> void:
	var transition = null

	if state:
		_state_logic(delta)
		transition = _get_transition(delta)
	
	if transition:
		set_state(transition)
	
func set_state(newState) -> void:
	previousState = state
	state = newState
	
	if previousState:
		_exit_state(previousState, state)
	
	if state:
		_enter_state(state, previousState)


# abstracts

func _state_logic(delta) -> void:
	pass
	
func _get_transition(delta):
	return null
	
func _enter_state(newState, oldState) -> void:
	pass

func _exit_state(oldState, newState) -> void:
	pass
