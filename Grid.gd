extends TileMap


var GridLine = preload("res://grid_line.tscn")
var zoom_level = 1

#get data from settings
var grid_size = Vector2(84,60)
var cell_size = 64

# Called when the node enters the scene tree for the first time.
func _ready():
	zoom_level = get_viewport().get_camera_2d().zoom.x
	draw_grid()


func draw_grid_line(line_num, column):
	var line = GridLine.instantiate()
	line.default_color = Color(.4,.4,.4,.5)
	line.width = 1 / zoom_level
	line.antialiased = true
	
	if column == true:
		line.add_point(Vector2(line_num*cell_size, 0))
		line.add_point(Vector2(line_num*cell_size, grid_size.y*cell_size))
	elif column == false:
		line.add_point(Vector2(0, line_num*cell_size))
		line.add_point(Vector2(grid_size.x*cell_size, line_num*cell_size))
		
	if int(line_num) % 10 == 0:
		line.width = 5 / zoom_level
		line.default_color = Color(1,0,0,.8)
		
	add_child(line)


func draw_grid():
	erase_grid()
	prints('drawing at zoom level', zoom_level)
	
	for column in grid_size.x:
		draw_grid_line(column, true)
		
	for row in grid_size.y:
		draw_grid_line(row, false)


func erase_grid():
	for child in self.get_children():
		child.queue_free()
