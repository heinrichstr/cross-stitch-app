extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = StitchColors.stitchColors.filter(func(color): return color.stitchDmc == StitchState.currentStitchColor)[0].stitchDmc
