extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_tile_color_atlas(): #takes the current color in DMC and returns the associated tile atlas for that color
	var tile_atlas
	for stitch_color in StitchColors.stitchColors:
		if stitch_color.stitchDmc == StitchState.currentStitchColor:
			#set tile atlas for that color
			tile_atlas = stitch_color.tileAtlas	
	return tile_atlas


func draw_cell():
	var mouse_position = get_global_mouse_position()
	if mouse_position.x < StitchState.grid_size.x * StitchState.cell_size and mouse_position.y < StitchState.grid_size.y * StitchState.cell_size and mouse_position.x > 0 and mouse_position.y > 0:
		var tilemap_coords = local_to_map(mouse_position)
		set_cell(0, tilemap_coords, 2, get_tile_color_atlas(), 0)


func clear_cell():
	var mouse_position = get_global_mouse_position()
	var tilemap_coords = local_to_map(mouse_position)
	set_cell(0, tilemap_coords, -1, Vector2(0,0), 0)


func _physics_process(delta):
	if Input.is_key_pressed(KEY_SPACE): #bypass input if scrolling viewport (Camera2D node handles this)
		pass
	else:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			draw_cell()
		elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			clear_cell()


func commit_to_undo():
	pass
