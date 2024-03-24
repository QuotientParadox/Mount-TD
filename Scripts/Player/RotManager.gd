extends TextureButton

#TODO: make tower
@onready var tower_var = preload("res://Game Objects/Towers/Maple Syrup Tower/Maple Syrup tower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Ui.get_child(0).placement_pos = get_child(0)


func _on_gui_input(event):
	var tempTower = tower_var.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(tempTower)
		print("pressed")
	elif event is InputEventMouseMotion and event.button_mask == 1:
		tempTower.global_position = event.global_position
		print("held")
	elif event is InputEventMouseButton and event.button_mask == 0:
		tempTower.process_mode = Node.PROCESS_MODE_INHERIT
		print("let go of")
