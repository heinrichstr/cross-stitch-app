extends MarginContainer


var labelText = "default"
var color = Color(0,0,0,1)
var onClick = func(): print('default')
var dmc = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Label.text = labelText
	$HBoxContainer/ColorRect.color = color


func _on_button_pressed():
	print("pressed")
	onClick.call()
