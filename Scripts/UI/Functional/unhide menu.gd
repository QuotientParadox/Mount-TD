extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Ui.visible = true
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
