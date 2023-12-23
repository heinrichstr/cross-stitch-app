extends Node2D

# helper function list~~~~~~~~~~~~~~~~~~
# load design
# save design
# reset state

func _ready():
	DisplayServer.window_set_min_size(Vector2(720,480))


func _unhandled_input(event):
	if Input.is_action_pressed("zoom_in"):
		if $Camera2D.get_zoom().x < 1.6:
			$Camera2D.set_zoom($Camera2D.get_zoom() * Vector2(1.1,1.1))
			$TileView/Grid.zoom_level = $Camera2D.get_zoom().x
			$TileView/Grid.draw_grid()
	elif Input.is_action_pressed("zoom_out"):
		if $Camera2D.get_zoom().x > .12:
			$Camera2D.set_zoom($Camera2D.get_zoom() * Vector2(.9,.9))
			$TileView/Grid.zoom_level = $Camera2D.get_zoom().x
			$TileView/Grid.draw_grid()
