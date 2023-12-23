extends Node2D

var undo_stack = []

# Add an action to the undo stack
func add_undo_action(action):
	undo_stack.append(action)

# Undo the last action
func undo():
	if undo_stack.size() > 0:
		var last_action = undo_stack.pop_back()
		last_action.undo()
