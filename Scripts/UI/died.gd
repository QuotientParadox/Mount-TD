extends CanvasLayer

@onready var score = $Control/VBoxContainer/HBoxContainer2/Score
@onready var high_score = $"Control/VBoxContainer/HBoxContainer2/High Score"

func _ready():
	Ui.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	score.text = "Score: "+str(Ui.get_child(0).enemy_count)
	high_score.text = "High Score: "+str(Saveload.save_dict["high_score"])
	Ui.get_child(0).enemy_count = 0
	Ui.get_child(0).reset_values()

func _on_yes_pressed():
	SceneTransfer.change_scene_to_file(SceneTransfer.previous_scene)


func _on_no_pressed():
	SceneTransfer.change_scene_to_file("res://Scene/Main Menu.tscn")
