extends CanvasLayer

@onready var panel = $Panel
@onready var audio_stream_player = $AudioStreamPlayer
func _ready():
	set_process_input(true)

# Called every time an input event occurs.
func _process(delta):
	if Input.is_action_just_pressed("pause") and get_tree().paused == false:
		pause()

func pause():
	if get_tree().paused == false:
		audio_stream_player.play()
		panel.visible = true
		$Panel/VBoxContainer/HBoxContainer/continue.grab_focus()
		get_tree().paused = true
	elif get_tree().paused == true:
		audio_stream_player.play()
		panel.visible = false
		get_tree().paused = false

func _on_continue_pressed():
	audio_stream_player.play()
	panel.visible = false
	get_tree().paused = false

func _on_quit_pressed():
	audio_stream_player.play()
	get_tree().paused = false
	Ui.get_child(0).reset_values()
	SceneTransfer.change_scene_to_file("res://Scene/Main Menu.tscn")
	panel.visible = false
