extends VBoxContainer

var StitchUi = preload("res://ClickableStitchUi.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	setColorsList()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func setColorsList():
	
	for stitch in StitchColors.stitchColors:
		var new_stitch = StitchUi.instantiate()
		new_stitch.dmc = stitch.stitchDmc
		new_stitch.labelText = stitch.stitchName
		new_stitch.color = stitch.stitchColor
		new_stitch.onClick = func(): StitchState.currentStitchColor = new_stitch.dmc
		add_child(new_stitch)
