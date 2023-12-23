extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if Input.is_key_pressed(KEY_SPACE): #bypass input if scrolling viewport (Camera2D node handles this)
		pass
	else:
		if event is InputEventMouseButton and event.pressed:
			if event.button_index == 1:
				# Get the position of the mouse click in world coordinates
				#var mouse_position = get_viewport().get_mouse_position()
				var mouse_position = get_global_mouse_position()
				
				# Convert world coordinates to map coordinates
				var tilemap_coords = local_to_map(mouse_position)
				
				# Output the tilemap coordinates
				print("TileMap Coordinates:", tilemap_coords, get_tile_color_atlas())
				set_cell(0, tilemap_coords, 2, get_tile_color_atlas(), 0)
			elif event.button_index == 2: #erase tile on right click
				var mouse_position = get_global_mouse_position()
				
				var tilemap_coords = local_to_map(mouse_position)
				
				print("TileMap Coordinates:", tilemap_coords, get_tile_color_atlas())
				set_cell(0, tilemap_coords, -1, Vector2(0,0), 0)


func get_tile_color_atlas(): #takes the current color in DMC and returns the associated tile atlas for that color
	var tile_atlas
	for stitch_color in StitchColors.stitchColors:
		if stitch_color.stitchDmc == StitchState.currentStitchColor:
			#set tile atlas for that color
			tile_atlas = stitch_color.tileAtlas	
	return tile_atlas
