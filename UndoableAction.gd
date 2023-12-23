extends Object

var tilemap
var cell
var original_tile
var modified_tile

#func init(tilemap, cell, original_tile):
#	self.tilemap = tilemap
#	self.cell = cell
#	self.original_tile = original_tile

func _init(tilemap, tileArray):
	self.tilemap = tilemap
	self.cell = cell
	self.original_tile = original_tile

func perform():
	tilemap.set_cell(cell.x, cell.y, modified_tile)

func undo():
	tilemap.set_cell(cell.x, cell.y, original_tile)

#idea below:

#Tilemap keydown creates new array
#push {original: stitchcolor, new: stitchcolor, tileid} to this array for each new tile
#on keyup create a new (this) and push the array to it
	#tilemap then pushes this with the array to the stack
	
#somewhere will need to be the current "index" for the undo stack so redos can happen
	#when a new action is performed, erase all undo actions after your current indexed action before pushing new ones
