extends Camera2D

var mouse_start_pos
var screen_start_position

var dragging = false


func _ready():
	pass # Replace with function body.


func _input(event):
	if Input.is_key_pressed(KEY_SPACE):
		if event.is_action("click"):
			if event.is_pressed():
				mouse_start_pos = event.position
				screen_start_position = position
				dragging = true
			else:
				dragging = false
		elif event is InputEventMouseMotion and dragging:
			#position = 4 * zoom * (mouse_start_pos - event.position) + screen_start_position
			position = .9 * (Vector2(1,1) / zoom) * (mouse_start_pos - event.position) + screen_start_position 
